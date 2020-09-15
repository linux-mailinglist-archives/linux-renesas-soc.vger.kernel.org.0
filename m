Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561DE26A082
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 10:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIOIRo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 04:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgIOIRb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 04:17:31 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19DDC061788
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:17:30 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u4so1970935ljd.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2020 01:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wSLvEbWUg4Ug2BVyyqv5vvUZvbtKlJG0+Q7PCjm2FzA=;
        b=NAS48IZIfyP4kD83np5T/GF/syBkoOrgtoI9aWrrHlYzEIRZz1wxPQrShGDrmFfTKu
         lxQ+JGSIaBnuwIWOpUi07GIpt5r5obMALg0LBxuMYLcDSy4F5BihI9Z7VQ2oOmLnNtff
         Zk+1a0ozqUNAqpecWyyHI7Adj0cRUH4sjNDwfkDLXuOiwiHkI+RnhQJf5crA12DcNSXs
         +BuzPHhVzPk37j3qrY7H8M23exIgV4BJ09DqViKKv1Rk3xgK3UWYjxaacGFl+QQj3XJu
         ioOSXk3ZJxbBnEzkduymqMI5UxrCg1EVraJwseH25h5iG8Z+hAHlsXVPe5NwLOFd/UeK
         z1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wSLvEbWUg4Ug2BVyyqv5vvUZvbtKlJG0+Q7PCjm2FzA=;
        b=U7ylUtjH6h/uU1P+HCyyPqPckuEX1TIVGnOirrx8WL6DKVqFJwmW80p7XBoOXrbSm0
         d25NSjYUhKleUGNaHjfVpm5N4oaQZx23U5NtAL8CJKd5G6KAw4ULSCxmZtkOfCWf8XAE
         uXZwa/uKkydAnPKe+AGQsUzMNjXOhImxiPaQtSUjg6KkV4yiJV9clcUcKfSZQ24QJz3S
         CUOK4nU5KYuWvU/TL25m/BaD0EF+6DmCOF6y0v8UnciddG0McExNO3HBJM14izvnfGFt
         QsvWscDXJ3j07Wxv0sC8p+H5ChyXecB9iiBvoJxxyKH2qdYPJNCyw7JvLAaXQHd7YMrJ
         gcig==
X-Gm-Message-State: AOAM530nEzvx4881DjSN17e6HttMy7T59qN8U44le/gOBGmA2KNCHU5E
        LaI/E4Zl+4vZVi1Aj7FL0e06JQH0shE7AQ==
X-Google-Smtp-Source: ABdhPJyOm8IDrNyHKmaTsBi/3RUGfUmFHAspuB/WiyixYhSvZaTh2AsqfCaUvlBsUgqtqc+8w4cfrQ==
X-Received: by 2002:a2e:9089:: with SMTP id l9mr5959014ljg.118.1600157838914;
        Tue, 15 Sep 2020 01:17:18 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4246:524b:f990:5ce8:4590:941a? ([2a00:1fa0:4246:524b:f990:5ce8:4590:941a])
        by smtp.gmail.com with ESMTPSA id 68sm4562942ljf.14.2020.09.15.01.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 01:17:18 -0700 (PDT)
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: r8a77990: Add VIN stf8 pins
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200914233744.468175-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914233744.468175-4-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <644860de-61bd-fe5f-ab7f-e8f93e75133c@gmail.com>
Date:   Tue, 15 Sep 2020 11:17:13 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914233744.468175-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 15.09.2020 2:37, Niklas Söderlund wrote:

> This patch adds VIN{4,5} sft8 pins to the R8A77990 SoC.

   So, is it sft8 or stf8? :-)

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 32 +++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> index c926a59dd21ceadc..1304559f04e5de4e 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
[...]

MBR, Sergei
