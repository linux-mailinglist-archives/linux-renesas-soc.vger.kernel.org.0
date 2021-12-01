Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E1B465843
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 22:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344041AbhLAVWO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 16:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344040AbhLAVWO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 16:22:14 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A39C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Dec 2021 13:18:52 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id o17so25523900qtk.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Dec 2021 13:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b8vgoAoZ91QTBQeNq/7pHGnW/opI+Ut4MEnu2qhtgD4=;
        b=hzhORA2lw3S8x6OlyTSSZPtpX+49RWaJ5mFSze63Xv9KM80O3jFwf+h40jtWNCFr7Z
         D7UmNZDBSpPjWXC/sAzKfYSzNiDgiML6xec8B/WxdnkIMzWwDJUGwiHqeHDZLBMyS0Er
         NqJXtvOWUnz5tTmzk0lAlYUs1mEwi4Zj9xUvGZKplN6JC0csZqevljbSWwYA3rZIkr3f
         5gmzVGRrgRqbjlpQu8CSTtCyT4mdOOPXHAIYoHv+YILfdDSthKogff4T6QXBF6HIeMmP
         3/KUPGHFq4zk+4wPn+0ySGzRbtj2xewPBe+iHfUufj17IiFHKDdRx3pY8ZSNj2ZFKAUR
         TWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b8vgoAoZ91QTBQeNq/7pHGnW/opI+Ut4MEnu2qhtgD4=;
        b=cdK5CDBTvAtKqMAPBXyNqc6t1N1PxnvRKY9iKDgq6Rx83IxaGD9pWH/cbg4w8T3AAX
         VXbzJg/9f9+Fyxjz1itfL/mpbtTlDWYsdIMcnqwRwmGQEY3OSAXuls5xYE+tf4/pS4Qe
         TKMmFFx6PYUE2gQTy2v8rdYTi3EHu7xRNVGOhNrev0H+aANlIHaDBCAq2hOM7uvOYNvK
         9Cjrg9rrzFbR2k79iD54nUDiX48rfxaf8mlaS4saD9tXBLREUokJwpXvyMAUboo+VH22
         rjO08+Pz3kAfA0HaxqM1SXrewKDPo3sZ6OxouK0Zhj/2PbMjlthgH8CcTOsgKga4zKQH
         ccwg==
X-Gm-Message-State: AOAM532zRCEClRgjW3gTDuekKd2liBat+xdp8ixcjE9NRBQZnkH7fs/B
        P1OsZEyG+7fVBWIedRxlim1x5w==
X-Google-Smtp-Source: ABdhPJxqGOqq/gw6JuZdVLFQOpcFbkU+SQpOD5ytqySci0rhxYTI1yg25DOl+iiS5T+fQnZLF0zf8g==
X-Received: by 2002:a05:622a:186:: with SMTP id s6mr10238691qtw.477.1638393531681;
        Wed, 01 Dec 2021 13:18:51 -0800 (PST)
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id bp38sm462037qkb.66.2021.12.01.13.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 13:18:51 -0800 (PST)
Date:   Wed, 1 Dec 2021 16:18:50 -0500
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
Message-ID: <20211201211850.GA3132024@maple.netwinder.org>
References: <20211126140625.351697-1-miquel.raynal@bootlin.com>
 <20211126140625.351697-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211126140625.351697-3-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 26, 2021 at 03:06:24PM +0100, Miquel Raynal wrote:
>Introduce Renesas RZ/N1x NAND controller driver which supports:
>- All ONFI timing modes
>- Different configurations of its internal ECC controller
>- On-die (not tested) and software ECC support
>- Several chips (not tested)
>- Subpage accesses
>- DMA and PIO
>
>This controller was originally provided by Evatronix before being bought
>by Cadence.
>
>Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I've given it a try and all seems to be well. Thus:
Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>

>+	mtd = nand_to_mtd(chip);
>+	mtd->dev.parent = nandc->dev;
>+	if (!mtd->name) {
>+		dev_err(nandc->dev, "Missing MTD label\n");
>+		return -EINVAL;
>+	}

Minor item: could the node name be used as a fallback when label is not 
present?

Regards,
-Ralph
