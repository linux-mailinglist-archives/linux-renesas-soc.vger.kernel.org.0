Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2389781E07
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Aug 2023 16:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjHTOEG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Aug 2023 10:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjHTOEF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 10:04:05 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0F83C00;
        Sun, 20 Aug 2023 07:03:54 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68a3cae6df9so147327b3a.2;
        Sun, 20 Aug 2023 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692540234; x=1693145034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JycbWyuWr3RRr6cmZeAMjPDQ3fLyzw41zO2/maFpBk=;
        b=COwWRgeratyfGXybNmEhCW0hFf5AaYrHkCqTJQWDIhbhfXIz5nFSd2rjvpGPUV0/ZY
         Hx6dDsfGJT4bymcMqz9MB2m35TVTXJGAGv7RqFzOgB83z4vWUgYZEdV93FpbRAVXDkD7
         MtIzp0TJOuMQ6JR+6o0uhmSvI5mP6wtBZ8VjCrFVf9AZYxk9pvRAb13hZexrqFJlXCIw
         UAQhCRcUNsv+o9cC1g+fUBZz1R9YmlreRjQ8qF9ZLBzjBrIy0jsHCH2tiaYwICuzK38F
         KqeihGxcZmq80AnkNfwPD+0VbDEKGILcq3VrIM/l6UAYYWep+qjc1f0CZy5rJ4foKBU5
         Alxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692540234; x=1693145034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JycbWyuWr3RRr6cmZeAMjPDQ3fLyzw41zO2/maFpBk=;
        b=VzHyy+DGC4XOsQ47Bwl0TbR4/yULH0iJ7LE5eFh6rcuiaFGLkf/u5U12ZVDptXkvUk
         w2D5L4H8s/OEl7kB1waqPjfY2O3aissynvSJLaRsNUGD3Z3yaKPByMgE7ZkuT55eCE0L
         PnJGVAHGTTyB6FJnWzgslfGfJohM+JegMPFbWFplK+qt+SfroPw2XYzfWeaFS82TIBO1
         kXQchmzCFrOW49GHd7wU+uiWsamjFdA7dfIBEdyFPzBQSYJ05QD0rZdcnxApqNQNhMZl
         WJiQogO/Pr35L06G7vpvmlMj8y1vuvNXqsDc+hqEPTjRrqpKrLNDmGsFid7+gBCj6IQG
         Y0JA==
X-Gm-Message-State: AOJu0YwLfd+Ldb111Am7xPzIbtVfuaMubNAf1rN5B6ElhDDxIa8Twneu
        o9nUDYsZas4A1HsL4nZg4Hw2s+r00AQ=
X-Google-Smtp-Source: AGHT+IEmekty0yD90UbY5IHvVOCHJVTraDwpNl8j19x6VlIJj42t0dt2SsxtLg3oktRGbCpwpfSQNA==
X-Received: by 2002:a05:6a00:1788:b0:687:42be:a274 with SMTP id s8-20020a056a00178800b0068742bea274mr3693933pfg.5.1692540233854;
        Sun, 20 Aug 2023 07:03:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h26-20020aa786da000000b0067777e960d9sm4501736pfo.155.2023.08.20.07.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:03:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 20 Aug 2023 07:03:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] Convert enum->pointer for data in the tmp51x match
 tables
Message-ID: <ce30e9ad-67e8-4dfb-93f9-e9a6a89d6bbe@roeck-us.net>
References: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230820124910.71526-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 20, 2023 at 01:49:08PM +0100, Biju Das wrote:
> Convert enum->pointer for data in the match tables, so that
> device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> bus type match support added to it.
> 

I don't see why this would be necessary. You don't explain why the current
implementation would no longer work. Various other drivers implement the
same mechanism as this driver, i.e., type cast the return value of
device_get_match_data() to a non-pointer. I'd argue that changing the
functionality of device_get_match_data() such that this is no longer
possible would be inherently flawed and would introduce unnecessary
complexity to drivers using that mechanism today. If
device_get_match_data() is enhanced to include the functionality of
i2c_match_id(), it should be done in a way that doesn't mandate
such an API change.

> This patch series is only compile tested.

I assume that means you don't have access to the chip. Is this correct ?
Just asking, because it would be great to have a register dump which
would enable me to write unit test code.

Thanks,
Guenter

> 
> Biju Das (2):
>   hwmon: tmp513: Convert enum->pointer for data in the match tables
>   hwmon: tmp513: Add temp_config to struct tmp51x_info
> 
>  drivers/hwmon/tmp513.c | 51 ++++++++++++++++++++++--------------------
>  1 file changed, 27 insertions(+), 24 deletions(-)
> 
> -- 
> 2.25.1
> 
