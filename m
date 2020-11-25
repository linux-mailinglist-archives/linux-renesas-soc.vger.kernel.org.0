Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC60C2C3AC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 09:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgKYIQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 03:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgKYIQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 03:16:46 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B832C0613D4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2020 00:16:46 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id j205so1887583lfj.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2020 00:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=toCcjhVahMfv5rVxa17TnH9DkHrfh5fuFWuNcxGKkSw=;
        b=oXcN+XoBAx+NaWINoKp9eN0M1lEFHx2m21sXRLIxsTb2mLhQk0K67wilV87c2tfoOT
         G/T42FzijHRcARhwZNRXn4QnEW0ZlAKWUQfrSc9scfblgA+BGKL50blPoIhODz7ADaBv
         2mXWIxun6D5tutss0YXV8nxzhPiW/P/cPUVYMzxX1ZL1/i4RYzqsaF3Va/3k3xq8rqU5
         bpfUTse2wDtgaySgXaMXAS7rVB9QAAJhLrNynhZ40zDZW3V/ERjAxtf5X/oGmD4U3OOi
         rmJSX53hADPUHdGpuMJ4CfNfcPJLYokEejUKw6Ls1yqqhc1QWbDSzSrQSAsTRQQfPFLa
         OGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=toCcjhVahMfv5rVxa17TnH9DkHrfh5fuFWuNcxGKkSw=;
        b=kA68TjogPCSzTJpQ4pCpR0DQhKYRmCuBz0r9EpO1jXbvnOhSebvnZ4yrUz+JMVuudh
         LC2p206HxPz4C/ayz4fkuy7N6lfOlr7cAycR/GfNbbHdvjBgNspbJPKZk/UicKKdgTya
         JF/9BjrZxx/3Tefc5qP3X3VQgy3vLW+am4F3MEFIAxixO2Btp5hAMQSdRtzk9XU97xS/
         cmHDxssv3obxtrBuArlQ50L6tG8BkeGXGeaiRk7/WuQV7LlrbKzFsLf9QimBL6CaiXC6
         BvIs0F0pIH3cHFyhow6ekXA8miljYkbPBjRAUFK3CBgQfsMfuTw6TRL9p97UeyftJVv8
         cVfA==
X-Gm-Message-State: AOAM533Ow0kjF002h2hwIFPsqVX9MasMPLvqsgVdcGNO0pBBuV2RInJm
        oFn2opnG+uMsSjdRfE0a52vydbUE7Rut+g==
X-Google-Smtp-Source: ABdhPJw+Eq5D17DsUHrY7QFiCpZNd4mZknrZ1jqGQig0bseWF0oH2YDscaHMnZN9dZ6HcTkKpJbyDw==
X-Received: by 2002:a19:8cd:: with SMTP id 196mr848785lfi.384.1606292204449;
        Wed, 25 Nov 2020 00:16:44 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:4212:944b:4041:d4db:b733:f39e? ([2a00:1fa0:4212:944b:4041:d4db:b733:f39e])
        by smtp.gmail.com with ESMTPSA id d19sm166071lfc.139.2020.11.25.00.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 00:16:43 -0800 (PST)
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: disable pm_runtime in case
 of failure
To:     Wang Li <wangli74@huawei.com>, yoshihiro.shimoda.uh@renesas.com,
        kishon@ti.com, vkoul@kernel.org, biju.das@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org
References: <20201125023147.2819115-1-wangli74@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <a820f186-aacd-e90a-fb0e-503b223aba08@gmail.com>
Date:   Wed, 25 Nov 2020 11:16:34 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125023147.2819115-1-wangli74@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 25.11.2020 5:31, Wang Li wrote:

> pm_runtime_enable will increase power disable depth. Thus a pairing

    Decrease?

> decrement is needed on the error handling path to keep it balanced.

    Increment?

> Fixes: 5d8042e95fd4 ("phy: rcar-gen3-usb2: Add support for r8a77470")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Li <wangli74@huawei.com>
[...]

MBR, Sergei
