Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5336C209BFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 11:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390074AbgFYJhB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 05:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390903AbgFYJhA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 05:37:00 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE69C061573
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 02:36:59 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u25so2859171lfm.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RnEBrQRLE1A17BuChdvyxVDc8sepHuIB2gbe0rLfuU4=;
        b=HqiQRb0B9Qp4jZNOzOBU+ZZsG9BHYPfyxziQLBKS9VUqlBTmHcupeuVRnB9px8fXta
         GGapfozqxbJezjsIEcZzgjsRkmFA1I8Qr7O4DVcRz0qX2MawDB9w7tqlf75MclgSR2Bq
         FIkblQKNbXMWHzERLB9HU8Vh/SSMV8jmOhLgFU5TfnVq8CtqonZInsdNqR7dgxrSEtcE
         n8cKY1chcOdpMR0pSJbkfYoXUKWBMH5XNxoj+Zqs6mlqgJC4CvzLXcZA9zI4ivg5dKzK
         B+ohs2+wFfpn4SYqHtcieM7C9zOdbIdwvPhU+SGvGh/MLqNoulp2r86JzMQ3O1slb2kf
         5IAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RnEBrQRLE1A17BuChdvyxVDc8sepHuIB2gbe0rLfuU4=;
        b=im8e6L/3/dHCnhxNmvssObh5+Tha+DBa79Zea3tj5jhwALIdFg3NAZf5ILm7L4GPqN
         b8RNa+vUE7GuXodXgr8/nQotXbJ5gfSjXJuhpMuudahPI8hHJDiWSv0cU3wh0MighLaK
         RXwTV4C3g4C5VkQks/BrbvcxQc4iIQfUUxeA8h5B1+1+MBIvQ3M6cHvxlmvttEfWSlvB
         sBJxhC6i+fJnxwJfJaNTBM8edPEfNhpXOMNtYcmYqMMatTxFFHM7ChQZ8dc5tZprG2FR
         SmUYWta5SEXdvITVCg0ZaDTdW516SgKCeHu+sWCeR1cgT0sYwySOAG+KkycLhbZN3FIj
         +p8w==
X-Gm-Message-State: AOAM531UVHs1TfrQbvfJ4fVmwHg057D33xbo5O/ZguC9H0I2iKZs3r1x
        zxT6uAWmLXN7KAAzh05Fa6n/QNT5L/Q=
X-Google-Smtp-Source: ABdhPJyZ0zneCUtrqOHUqrWXK+RPvNM0tIG8pZ6lhxr+NlOHHWGvv+DvxhiWHMqfb7FGDS5i4e1zWg==
X-Received: by 2002:a19:83c7:: with SMTP id f190mr18042262lfd.14.1593077817815;
        Thu, 25 Jun 2020 02:36:57 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:44da:b8e6:887f:f9f8:ffc4:9fb8? ([2a00:1fa0:44da:b8e6:887f:f9f8:ffc4:9fb8])
        by smtp.gmail.com with ESMTPSA id f11sm231400ljg.10.2020.06.25.02.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 02:36:56 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a77980: eagle/v3msk: add
 QSPI flash support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
 <fca1d012-29bf-eead-1c0d-4dd837c0bc68@cogentembedded.com>
Message-ID: <2bc79e8e-953f-2d9a-1bfb-798aac9ae2ce@cogentembedded.com>
Date:   Thu, 25 Jun 2020 12:36:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fca1d012-29bf-eead-1c0d-4dd837c0bc68@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

    The subject should read r8a77970, thanks Geert for noticing...
