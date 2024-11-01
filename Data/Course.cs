using DuwademyMobile.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace DuwademyMobile.Data
{
    [Serializable]
    public class Course
    {
        [JsonPropertyName("courseId")]
        public int Id { get; set; }

        [JsonPropertyName("name")]
        public string Name { get; set; }

        [JsonPropertyName("imageName")]
        public string ImageName { get; set; }

        [JsonPropertyName("duration")]
        public int Duration { get; set; }

        [JsonPropertyName("description")]
        public string Description { get; set; }

        [JsonPropertyName("category")]
        public Category Category { get; set; }

        public string ImageSource => CoursesViewModel.GetImageSource(ImageName);
    }
}
