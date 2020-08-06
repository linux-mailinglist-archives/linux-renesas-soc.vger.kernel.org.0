Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5B123D8F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 11:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgHFJz1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Aug 2020 05:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729288AbgHFJzT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 05:55:19 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02806C061757
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2020 02:55:19 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b30so25794170lfj.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2020 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iLnO85sDWXnc5STHtwImT7+YI1lTMI4nQkXxGiWw4yQ=;
        b=nvsmESMdl5RAq10DE60VGnhFNPgI8dMtwtCGnrqVlmsKrV1wLx1jyUtzCcLK39LHWx
         jlSTxB3xnGq+7T41XmrqoI3ddOANsomxvEtKRMpe7gkxFajnmlNu/+TgoPJfMpmTsPEQ
         qA0dANHTJ0XIhEVE2IoeP6UFW20IvHXfIBnGWon+JNIhIP5tnridb2IvIEIGkmb60QIm
         Lk7/9dqDZEeXCLIQsj6CEhnUthx48qsVVpnSyaPWSdKegLkIfsE9tnZSr11CKDhvtgcd
         a0mqYJGnMkjE41f7AT/xbttcyV+CcjOFdc7C7E9I82AQfqSEcZO5F8nRINaj6ECyDz0N
         hU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iLnO85sDWXnc5STHtwImT7+YI1lTMI4nQkXxGiWw4yQ=;
        b=CdUIzCjfmLFsfAZcA8BFlii5hgz6IM/+gb3v1RVCaP+9pv10YslQhlFgMK+gmrK8K7
         HAj/aFpMXPtADbzuVOsnxHp8yYUlyMXozti2kIPwQzU7T0Fw/p1Dq2rxhJVMqH6gkf+R
         VRCUTwJjasUQn8DMObzM5QPMDQxfZuhpo8sHByQoha3SvC008GweFP0jTr5PT7l7sm83
         YttLDsobZ9TIzN3LyHikZq1B3HNWhlLXYjA4OzLawVZV9SxAtyTFaGJmp4RpgmtvQPMA
         J6rGretgKOYVMJvIeLVmIQ0w6M1EVNAw1lXCfQQUGuuQ1z1EaOXJh1phHDwkEKoGwD9Z
         +Huw==
X-Gm-Message-State: AOAM531EgT3tmbS6q6tSmJ+t27Dgavxz+9WDdPDfKHKFnBFyILI4LOF3
        ox7sgXGdty+b+NygMItuLDAwaxU2
X-Google-Smtp-Source: ABdhPJzDdypt2ZljenRGREuPMirGGHnsauTQZo/TqPzm2uCRxxQhf6tfTvI0RkyPjiLn57s/1Xaalw==
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr3531692lfp.23.1596707717352;
        Thu, 06 Aug 2020 02:55:17 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42cb:55ed:b0ec:135a:626d:113? ([2a00:1fa0:42cb:55ed:b0ec:135a:626d:113])
        by smtp.gmail.com with ESMTPSA id f14sm2476121lfd.2.2020.08.06.02.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 02:55:16 -0700 (PDT)
Subject: Re: [PATCH 1/8] card: Add a method to retrieve the device minor
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
 <20200806021807.21863-2-laurent.pinchart@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <c7aa64ac-d1b6-9c2c-3d28-c2974f096772@gmail.com>
Date:   Thu, 6 Aug 2020 12:55:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806021807.21863-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 06.08.2020 5:17, Laurent Pinchart wrote:

> The device minor number is needed to access the debugfs directory
> corresponding to the device. Make it available to users through a
> get_minor() method on the Card object.

    Didn't you call it dev_minor() below?

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[...]
> diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
> index 5c1cf7cfcedc..0a11747f7985 100644
> --- a/kms++/inc/kms++/card.h
> +++ b/kms++/inc/kms++/card.h
> @@ -35,6 +35,7 @@ public:
>   	Card& operator=(const Card& other) = delete;
>   
>   	int fd() const { return m_fd; }
> +	unsigned int dev_minor() const { return m_minor; }
>   
>   	void drop_master();
>   
> @@ -84,7 +85,9 @@ private:
>   	std::vector<Framebuffer*> m_framebuffers;
>   
>   	int m_fd;
> +	unsigned int m_minor;
>   	bool m_is_master;
> +	std::string m_device;
>   
>   	bool m_has_atomic;
>   	bool m_has_universal_planes;
[...]

MBR, Sergei
