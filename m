Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91C35663F27
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 12:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232970AbjAJLRv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 06:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232682AbjAJLRq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 06:17:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80F8235
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 03:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673349421;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7R6k4XeSSfrouTet4Pl7FYt1MDO+biHA3LgQPUZKzOM=;
        b=PkdKWIR7QPEzuFMnMppcCEVq3ibLSxh0HQLEwGs1nIqdUTWk5+l53vb65OugsT1Sj7BjQp
        d4U+y+bqLJNkcsTb62HK4m4JUVWZzP3q4lKGndNVtZ65nJdGgTdU23aJTAOxEYdzvouW2O
        1giirtF38N5mhTq5laph7clukkLRoiQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-102-2LT9oIO-Maujmv2QGehxmQ-1; Tue, 10 Jan 2023 06:17:00 -0500
X-MC-Unique: 2LT9oIO-Maujmv2QGehxmQ-1
Received: by mail-qk1-f199.google.com with SMTP id i4-20020a05620a248400b006febc1651bbso8488272qkn.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jan 2023 03:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7R6k4XeSSfrouTet4Pl7FYt1MDO+biHA3LgQPUZKzOM=;
        b=dcohuvBM7dOzixU55G7swcPjLheSbBtl3Li+RZOLpMR+7ZxewHT7xbltC746SekJAJ
         YIDE1YMzkCtdHu3gRM1p4m+O+vO/VwpbVzYjlFRG/dzq1kqZXHtBLU6PHpDhsvJhnPgF
         1xpZOejQo+IWheAyVeYIMWXrsna/Co0j0u2nuZ1ujJnGgLsb26cdzuPaori+XNqFrO58
         y1EErQIC/agW0SFlzno4KrH5aeBN/GJwiNHnqahW69xo0n9VgDyg5sOB9pTt/wJx1Y0H
         8usTNo843p3mB8MUCrDkD3FgYjAHRxyHgEopTdZAeIRLQAVvAU0x/olGHTQKmhHnk/X5
         il1A==
X-Gm-Message-State: AFqh2kqSWQXq6nHjyDBulnmHeLdf8cjiGllyl5BdFXU31Pyljw5OwKOc
        mIbPVKgw+fHbV78gGD/8ULpmPBYVvoRo6RGUoaZIMTF17nmNLsMzPmIt6b60Wdh00Ly3A5WTQ1E
        SZGzSotlUfyBaRITatFsfZsJ0AuiKj7E=
X-Received: by 2002:ac8:520c:0:b0:3a8:1079:b844 with SMTP id r12-20020ac8520c000000b003a81079b844mr89443418qtn.46.1673349419765;
        Tue, 10 Jan 2023 03:16:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7LAw0VjeSUK8wkVXMaLsnRFvPYmNquEuKr7XZHAByB6NkEWLdJSItXvzP6gLV6c7Tmr1r8Q==
X-Received: by 2002:ac8:520c:0:b0:3a8:1079:b844 with SMTP id r12-20020ac8520c000000b003a81079b844mr89443387qtn.46.1673349419493;
        Tue, 10 Jan 2023 03:16:59 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-120-128.dyn.eolo.it. [146.241.120.128])
        by smtp.gmail.com with ESMTPSA id k8-20020ac80748000000b0038b684a1642sm5839964qth.32.2023.01.10.03.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 03:16:58 -0800 (PST)
Message-ID: <5bd7ee34ead313785951defbf3069b64d4338a45.camel@redhat.com>
Subject: Re: [PATCH net-next v3 01/11] net: mdio: Add dedicated C45 API to
 MDIO bus drivers
From:   Paolo Abeni <pabeni@redhat.com>
To:     Michael Walle <michael@walle.cc>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Date:   Tue, 10 Jan 2023 12:16:53 +0100
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v3-1-ade1deb438da@walle.cc>
References: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
         <20221227-v6-2-rc1-c45-seperation-v3-1-ade1deb438da@walle.cc>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 2023-01-09 at 16:30 +0100, Michael Walle wrote:
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 6378c997ded5..65844f0a7fb3 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -364,6 +364,11 @@ struct mii_bus {
>  	int (*read)(struct mii_bus *bus, int addr, int regnum);
>  	/** @write: Perform a write transfer on the bus */
>  	int (*write)(struct mii_bus *bus, int addr, int regnum, u16 val);
> +	/** @read: Perform a C45 read transfer on the bus */

Minor nit: s/@read/@read_c45/ 

> +	int (*read_c45)(struct mii_bus *bus, int addr, int devnum, int regnum);
> +	/** @write: Perform a C45 write transfer on the bus */

Mutatis mutandis, same thing here.

Thanks!

Paolo

