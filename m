Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A834221E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 11:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhJEJPt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 05:15:49 -0400
Received: from mail.iot.bzh ([51.75.236.24]:5772 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232871AbhJEJPt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 05:15:49 -0400
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id E88092A9A8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Oct 2021 11:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=bQsGsjbmxT6H8G4xmt5391UJxv
        zMiyUarLQv+2lnIY4=; b=DENCH1AdepAhJzPjurdf2NpOe48fqIXpSl0WY27o8/
        HlWYmvjE/47bKIBuEzCNNRTiuu6HUqe+tb3AitvcJEIIUZ2GSuj8VgqfIVDjS9Yy
        zDI1i9xw4VQUVwj1wvIVUMZawiqlZ0EZDCpDSnVGX1U3oEbxefbdwJ4PQbTWAVDd
        8x+dH6rntsZVvzz4RrHytDd862J36dv8yftLY/stzvOBcmUapLATOj8D/k1w+Cam
        ynOn2Bpgq7JcRhv7xcEXooCkmmi8TWkpoAeUPwHa1J7iel6FbtAzuM/hBSkEojwz
        O0+yeXk96m+Fn1kAXJ3MK5wOwZYt/eqEmJGErotBM4qg==
Message-ID: <6fffa976-d705-d25c-5349-9b535247adfd@iot.bzh>
Date:   Tue, 5 Oct 2021 11:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] soc: renesas: rcar-rst: Add support to set rproc boot
 address
Content-Language: en-US
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20210922145212.333541-1-julien.massot@iot.bzh>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <20210922145212.333541-1-julien.massot@iot.bzh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

> +/*
> + * Most of R-Car Gen3 SoCs have an ARM Realtime Core.
> + * Firmware boot address can be set before starting,
> + * the realtime core thanks to CR7BAR register.
> + * Boot address is on 32bit, and should be aligned on
> + * 4k boundary.
> + */
> +int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr)
> +{
> +	if (boot_addr % SZ_4K) {
> +		pr_warn("Invalid boot address for CR7 processor,"
> +		       "should be aligned on 4k got %x\n", boot_addr);
> +		return -EINVAL;
> +	}
Just notice that this 4K value is wrong, CR7BAR should be aligned on 256K.
Any comments about this v2 before I send an update ?

Regards,
-- 
Julien Massot [IoT.bzh]

