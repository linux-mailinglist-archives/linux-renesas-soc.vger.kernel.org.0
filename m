Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D051F6415
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2020 10:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgFKI5H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Jun 2020 04:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgFKI5G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 04:57:06 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEE7C08C5C1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2020 01:57:06 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z9so5947113ljh.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2020 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=scFpU96FicNROQOpmxn2PDjOw/uNRwojfypst9096Cg=;
        b=HH29tVR4h1vn6/ObayC4qnLIaEpKOvXIeg6nWcam91Aj9pXj9mW3v3RkMabQOr1Jhs
         u9ixLsVKLCP4MTlkzV5JSRrxzN60y4j/KtNSM0NXL7Q+dcyyPVKH3jEuPteQ+px2o8wg
         BgVTl1IjQ6YAU/BVgTgyYqAfPntApM0K70spDEaogxUmQDNNAJRnVHO2FggV1jJh3vfH
         M3AVyCUx6NqxIjaaKSeTutfki/QPqwqtNWfLMn8WG1Sz04tDJMbVjT6JRLUGy3a1aZZK
         tJxA8vFX7+g2FaQYWXmtp7Cx9BdP2df932H7dTkoSKQIwaNIS+b6p/KTDxwyv5OtiXCR
         iOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=scFpU96FicNROQOpmxn2PDjOw/uNRwojfypst9096Cg=;
        b=ecdSkjwVJ1bqGwhNNIk72rM/kCNA0K93ZM7LZuYhEWeQY3NEDiILJ9YpUO2xtJZUaZ
         o62on6Cg0wsamupElvOLpUuP2fwxQC4hIKVS2uZQRID4nupVFs/S+EoNSeA152iDfDTC
         1UGjJaaYUObFXZ0xoHBw3/hcZ5njkAOOadIStG9JFYBW9KRfwAaaQXXOQ7OjXEkCXpYs
         fKrY+qA8TEMQCS0y7YxSqj1z9/HpMS8R3GPjvseleNB/BsqjImaDfcwQTPNVNT1uOywO
         5J630SHgmKIQsjPkfOB38A8Fknogis6c7kVBGWBHxmG5dlfvNYRg4nQL1iV6EVBoVo1/
         0kSQ==
X-Gm-Message-State: AOAM533n7Im72vVusoDRhv0NGr6FxcPKgQOq2Gt4/AM70xIyxn9u8ZdC
        dVLaV8SoTD2M+uJ7dAUge2PnptRsA/a34g==
X-Google-Smtp-Source: ABdhPJyDtvFptbzJAPVCMO8GTWa2Efwcqc/41kyXqTSj0/+wCM2SbgRZS87nr9TM430j6czXUTB9xQ==
X-Received: by 2002:a2e:968a:: with SMTP id q10mr3617369lji.192.1591865824527;
        Thu, 11 Jun 2020 01:57:04 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:62f:7120:def:360c:f8bc:1a6f? ([2a00:1fa0:62f:7120:def:360c:f8bc:1a6f])
        by smtp.gmail.com with ESMTPSA id x23sm629172lfe.32.2020.06.11.01.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2020 01:57:03 -0700 (PDT)
Subject: Re: [PATCH 5/5] rcar-vin: Do not unregister video device when a
 subdevice is unbound
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
 <20200610230541.1603067-6-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <44f91d85-017b-9f8b-2223-a7424538b72d@cogentembedded.com>
Date:   Thu, 11 Jun 2020 11:56:53 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610230541.1603067-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 11.06.2020 2:05, Niklas Söderlund wrote:

> If the v4l2-async notifier have once been complete and the video
> device(s) have been register, do not unregister them if one subdevice is

    Registered.

> unbound. Depending on which subdevice is unbound other parts of the
> pipeline could still be functional. For example if one of multiple
> sensors connected to a CSI-2 transmitter is unbound other sensors in
> that pipeline are still useable.

    Usable.

> This problem is extra critical for R-Car VIN which registers two
> independent CSI-2 receivers in the same media graph as they can both be
> used by the same dma-engines. If one of the CSI-2 receivers are unbound

    DMA engines, maybe?

> the other CSI-2 receiver pipeline is still fully functional.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
