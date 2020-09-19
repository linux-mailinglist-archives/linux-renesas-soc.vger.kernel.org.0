Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0998A270BE1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Sep 2020 10:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISIi2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Sep 2020 04:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISIi2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 04:38:28 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822BBC0613CE
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Sep 2020 01:38:27 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d15so8621360lfq.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Sep 2020 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LNuNfpPRGy07pY63qabV79qfYDXbJrAVonhLvz8HFlM=;
        b=JN1yrS+gtLSUQrhYJ9CcDsRy6AAevxn9RPmOHrHGnc1+JcwyUXmPa5G6d0jOtBXX8G
         qNwYuE2IcrFHi1dM9jyiXD7FwOCM7wrLVd/liMw45IfXOwEyGUjSuxXi4Wmw1nwB9c4w
         Fsr70kS+ff8qsVAFk9Ki8KssZt+GM8EXArGmyqINmdAgj7ZCoLyhSDDNWv80v0XDXXIX
         5NeaQ+ZVrZXRo5rwYWcxnG+LPsCOXEaGSi9hYCQ+lxofPf2Bcn/WPlGKrZZslcBEUcf1
         ARvzFGy172NtueX7VrQvOO0M1n9GoTIh7lC4KBcV1EIuYKoW9HY0Ja8bahPwV6orfuqo
         kYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LNuNfpPRGy07pY63qabV79qfYDXbJrAVonhLvz8HFlM=;
        b=k3isaX9ve8e+Q4AfmqT34Ko6yciSiUPHeZYVNDakL38GNUQebbPpe4qmjkkFI4zB9O
         +7hz2w/GaCjpA19K9H0hQgoV2zqZ4CbjBFSKhgNNP/x07EfGb0qjb+qgt8tVFELsyTdN
         OQOLqWv7foddNS7D5r+sYROwhP6TrjNDgvflE3pShd0XcGP0tTcIuBW4RUlIDg38M1bc
         komwlqzQLQ44gWvH91X/2SsLzJSQCDxlNsb6i1VfLjc+ihVv/Ze4V8Rz9Lo7iWG0r+1W
         zL3N3Ya0GeqTXzQQ3FT0yfbpm9CfndC+fLo+Zf6ojJHlRP9ClrDTqIpBZdVOO2dhImT+
         KKjw==
X-Gm-Message-State: AOAM532IUnII2C3I/s5R/fO/98Xu3/LFcwrnhXoTNrFvb80zGk1uTQWU
        qKF7+Vr3VEHILH0z6zuWbM6czXYf8svRoA==
X-Google-Smtp-Source: ABdhPJzI5DhvTwXJ/YkwS8rgZg4/uIRBW8NxOdOdGGdl+4l6tJCYaJ/F4yd7/sXozOQWnNF8DaJlGQ==
X-Received: by 2002:a19:c18f:: with SMTP id r137mr11289446lff.238.1600504705632;
        Sat, 19 Sep 2020 01:38:25 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:6d6:f88a:e45d:fb56:aa68:38a? ([2a00:1fa0:6d6:f88a:e45d:fb56:aa68:38a])
        by smtp.gmail.com with ESMTPSA id u14sm1140604lji.83.2020.09.19.01.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2020 01:38:25 -0700 (PDT)
Subject: Re: [PATCH 3/3] tests: unbind/bind: Only test non display VSPs
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200918202616.55977-1-kieran.bingham@ideasonboard.com>
 <20200918202616.55977-4-kieran.bingham@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <f7c4fe78-359d-0a06-4850-1ccafdc31966@gmail.com>
Date:   Sat, 19 Sep 2020 11:38:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200918202616.55977-4-kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 18.09.2020 23:26, Kieran Bingham wrote:

> Only perform bind/unbind testing on VSPs which expose a media-device.
> Unbinding a VSP which is connected to a DU causes the display pipeline
> to fail, and is not currently supported.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   tests/vsp-unit-test-0026.sh | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/vsp-unit-test-0026.sh b/tests/vsp-unit-test-0026.sh
> index 88038f3fdebf..4185bb23d05b 100755
> --- a/tests/vsp-unit-test-0026.sh
> +++ b/tests/vsp-unit-test-0026.sh
> @@ -10,7 +10,14 @@
>   features="rpf.0 wpf.0"
>   
>   vsp1_driver=/sys/bus/platform/drivers/vsp1
> -vsps=$(cd /sys/bus/platform/devices/; ls | grep vsp)
> +
> +# List all VSPs with a media device.
> +# This exludes VSP devices used by the DU.

    Excludes. :-)

[...]

MBR, Sergei
