Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 557817007F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2019 15:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730172AbfGVNDd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jul 2019 09:03:33 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35570 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730173AbfGVNDb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jul 2019 09:03:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id l2so35245907wmg.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2019 06:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z0qoHRf6gBg774SquOndxWjyxuQj7ytfuhU1dKVmZIc=;
        b=gFw6hddQtS5TsFxCbCQSpkhs63CHqhJ4RgbSowbg74BxJ7cic6XC2z+l17Jyk24vUm
         oNm9OQJBSM1t5Nh4lk31FyHJRwMKFQckAEM59vY8ol9G14+6MXxbnhXkmCDbJb2LXRrB
         xYLg9Zx8TQtAf6pmIojayLjXiVBWa8MQtJXM4rYI2tRK6c7MqYVqZLxQIoCzB87ip81N
         1dXDgcUywQqo1+i0WBJ8Pjp1Tixjd2FxwetmSpRrplwNWhjPfExcD1CEwapuPBqxUbOj
         +RYvcEa0Nz+4Os149AsrVHH76zg85G0i5u4/TEfbKkRWqKjqF1PBvNtGB0iBeCL1CmR2
         Nz7w==
X-Gm-Message-State: APjAAAVNQh5duSNshd423gzMyiAJEGCE81Tf8HdR2SCg6sIDDWTOgE+o
        V1B4ezRXuJKtfzoz68Zii6o+5A==
X-Google-Smtp-Source: APXvYqzTOF/7H9s7MbgAEDOE8F8AmztVnXM/YlmJCgptbmvdVMuZ26+JpP/iPrValHmryWWxfk9AGw==
X-Received: by 2002:a1c:9a4b:: with SMTP id c72mr38257114wme.102.1563800608945;
        Mon, 22 Jul 2019 06:03:28 -0700 (PDT)
Received: from [192.168.1.13] ([90.168.169.92])
        by smtp.gmail.com with ESMTPSA id j17sm58257486wrb.35.2019.07.22.06.03.27
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 06:03:28 -0700 (PDT)
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
Date:   Mon, 22 Jul 2019 15:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Kieran,

On 7/10/19 9:39 PM, Kieran Bingham wrote:
> I2C drivers match against an I2C ID table, an OF table, and an ACPI
> table. It is now also possible to match against an OF table entry
> without the vendor prefix to support backwards compatibility, and allow
> simplification of the i2c probe functions.
> 
> As part of this matching, the probe function is being converted to
> remove the need to specify the i2c_device_id table, but to support
> module aliasing, we still require to have the MODULE_DEVICE_TABLE entry.
>

My opinion on this is that I2C drivers should register the tables of the
firmware interfaces that support. That is, if a driver is only used in a
platform that supports OF then it should only require an OF device table.

But if the driver supports devices that can also be present in platforms
that use ACPI, then should also require to have an ACPI device ID table.

So there should be consistency about what table is used for both matching
a device with a driver and reporting a modalias to user-space for module
auto-loading. If a I2C device was instantiated by OF, then the OF table
should be used for both reporting a modalias uevent and matching a driver.

Now, the i2c_of_match_device() function attempts to match by first calling
of_match_device() and if fails fallbacks to i2c_of_match_device_sysfs().

The latter attempts to match the I2C device by striping the vendor prefix
of the compatible strings on the OF device ID table. That means that you
could instantiate an I2C device ID through the sysfs interface and the OF
table would be used to match the driver.

But i2c_device_uevent() would had reported an I2C modalias and not an OF
modalias (since the registered device won't have an associated of_node) so
there's inconsistency in that case since a table is used to match but no
to report modaliases.

> Facilitate generating the I2C aliases directly from the of_device_id
> tables, by stripping the vendor prefix prefix from the compatible string
> and using that as an alias just as the i2c-core supports.
> 

I see two ways to solve this issue. One is with $SUBJECT since we can argue
that if a OF-only driver is able to match devices that were instantiated
through the sysfs interface that only have a device name, then a modalias
of the form i2c:<foo> is needed. Since the compatible strings without the
vendor prefix is used to match, then I think that makes sense to also use
them without the vendor prefix to populate I2C modaliases as $SUBJECT does.

The other option is to remove i2c_of_match_device() and don't make OF match
to fallback to i2c_of_match_device_sysfs(). This is what happens in the ACPI
case, since i2c_device_match() just calls acpi_driver_match_device() directly
and doesn't have a wrapper function that fallbacks to sysfs matching.

In this case an I2C device ID table would be required if the devices have to
be instantiated through sysfs. That way the I2C table would be used both for
auto-loading and also to match the device when it doesn't have an of_node.

If the former is the correct way to solve this then the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat
