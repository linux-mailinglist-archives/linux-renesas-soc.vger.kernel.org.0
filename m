Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941962C0F54
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Nov 2020 16:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732233AbgKWPvt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Nov 2020 10:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731987AbgKWPvs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 10:51:48 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A28C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2020 07:51:48 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id z21so24380735lfe.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2020 07:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LVAapKUsvG7d/MeGMieUI4uemPqYthLBSOaZiTexBIM=;
        b=kafc0Po0sRMU9R15i0bDxSFUjJh0gzWEEbWr/Xcy1QnCCI7eQfNZ5hYxDKfmGaWRGb
         /sagtGnSxdz64O4u9sJ6iASgfXmdRdfxH3V9d0pMR2kzqQpTv2HPB0S0dF19NrDZm6mb
         sweFrFutAXF2hOTMxz6qYnQ4nfSZfSYw6CLRTeV8deseXj0yXegyYB9Tsul9SC2xHzl3
         g/QVz/0BFhk89R6CfUM5U8vNVyCP28brMc75zZ+AgMFG+7lCX2K1cCshigUoTgLm8YcB
         Mdvj4ee1r18/w5TNgpejuKq5WAJRepuU9PLDs570QaYPLjLzwssQeipt7ngCQ/jI7HKO
         Wc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LVAapKUsvG7d/MeGMieUI4uemPqYthLBSOaZiTexBIM=;
        b=S0oMMtHOfcFXQq853L69O1aqZ9QefpOPbWm7hfqHsZY3y2+q+sCSNATd04yhK3VQD6
         MbrfEf6dDDQeFHjxlkh1hHqrGOydVZ1UhfYKkSscwJYChzj6F8CJLHzww58V6wa41ha5
         S2dRpgSQxBIY36KJJwz6lGLaMw6AR4QDaJBlOlAb5pKjGcA6NS5Fa7GH3CiJSMB8M7H9
         /wIpB1nFcb2PJXDQ8P4AMNBKKWsdxh+f3F1YnSUPMo4C7Bjaa/AJwmMZoBet080UbC1l
         2DsbgRUtjW/qyasFOzraShnmtFnLbv7f6wW1kIiGO6Qc2IM0S2CVi17sKcbxsjI4Dkfs
         Rpjw==
X-Gm-Message-State: AOAM530VBgV6HoWTS8B4jsaoTR5nLx68X84IzU82AFssfOdqR/IgJ1l6
        l5YmClYR9ZIG4QtI+xLJ1J0=
X-Google-Smtp-Source: ABdhPJywh4zVYrENBt3gNkI3RNrwM1nyGy9jZeeZJn7OdCStDqKnMi8CO2ucdN1r3dIFukFdXl6gXw==
X-Received: by 2002:a19:c717:: with SMTP id x23mr3545884lff.111.1606146707100;
        Mon, 23 Nov 2020 07:51:47 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:2d9:200d:7c26:7999:20ce:bced? ([2a00:1fa0:2d9:200d:7c26:7999:20ce:bced])
        by smtp.gmail.com with ESMTPSA id t17sm1428062lfk.61.2020.11.23.07.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 07:51:46 -0800 (PST)
Subject: Re: [PATCH v2] scripts: boards: Support alternative H3 variant
To:     Kieran Bingham <kieran@ksquared.org.uk>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20201123120150.117735-1-kieran@bingham.xyz>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <0d682991-9140-f1a9-7b44-98c303b5d37b@gmail.com>
Date:   Mon, 23 Nov 2020 18:51:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123120150.117735-1-kieran@bingham.xyz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/23/20 3:01 PM, Kieran Bingham wrote:

> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The Salvator-X H3 has had a rename of it's model information.

   It's actually "its". :-)

> Support the new naming, and add the extra variants now available.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
[...]

MBR, Sergei
