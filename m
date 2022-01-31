Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B6E4A4DA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Jan 2022 18:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234885AbiAaR7L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jan 2022 12:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbiAaR7K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 12:59:10 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAA3C061401
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 09:59:10 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id s61-20020a17090a69c300b001b4d0427ea2so19057228pjj.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jan 2022 09:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GTfk5dtnofD+DwQSBTggrf944TpHjURpGaUt6sHxP1Q=;
        b=zo7PV8Zd2Z7HIVMtmOiMcabS1N6sxBbjo3wwW81zQa4IENFd+3e1qlBJHlUZq9ntz+
         XqfG3FiwQvk7BkMKzEkrTK8KhKl8bZCQp61R1xdJf1S9wF/56YoXbTILPq45QQEx1fSh
         qDbMCmpmLx42v5eiBQi+snTnumsDFMmyNi7p2J7qmEpf/Q0W+tWRSYxd7R6rXO23yKNp
         eMGd4RXtD6PUL8AwbxNTR7tmpDMAYcRkYwTmmCgt3rFO3CXoS8g4hf8QkYIQwr1yPT2W
         YKmY+awyasNFLlw+dtDGpSReBp1a0X8b4c5W4Zbb1H5Li7iemUtlEkg083LPRVdpWVvw
         ce3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GTfk5dtnofD+DwQSBTggrf944TpHjURpGaUt6sHxP1Q=;
        b=Ea/wOMjfBTUmJ+CEzw2HnnPKrseFe4ZlHslqyUycjgMDCEzv9p216NbVoJ7+1k/jtO
         MyngiTQSAa8TN/D5H+rDk9tKFD6ozsMUclRBCTrr8umZ0/qEt9GmAlmgba8QH9IwK9CZ
         ZwuCGtFmxJik0+9tiQAUK5l8G72yP5JalAo67eG2fp9ocHsKkmXCfD2eIPxxGAyFTuEq
         1OXOMFovF0YcebiO7MerUxDirZDB7MJNIzCiudSI6iCFykbV0YKJhD5HHFpGXiBAldTo
         QC5KIeY4FByFjAephU5f8wQS6Ptm9PGoBWlYp/EXgpYUbCZursTNzWfCbz2/mwwK+NMy
         21XA==
X-Gm-Message-State: AOAM533TVcssPuqW12Qq86KgVoWK96SIlFKZjwSX29jlorLO1Ae+CxW2
        Dl2rHXbN1zbpnA8L9OF96aLpxg==
X-Google-Smtp-Source: ABdhPJwUpbKpp1BF/RE/P7pFaFs95WxKDdCWSlLhnXYDb8ikckCTeUYHjKtVxjHYzKFZsy5bOe8h5g==
X-Received: by 2002:a17:90b:1d8d:: with SMTP id pf13mr35398210pjb.232.1643651949935;
        Mon, 31 Jan 2022 09:59:09 -0800 (PST)
Received: from hermes.local (204-195-112-199.wavecable.com. [204.195.112.199])
        by smtp.gmail.com with ESMTPSA id o1sm20431282pfu.88.2022.01.31.09.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 09:59:09 -0800 (PST)
Date:   Mon, 31 Jan 2022 09:59:05 -0800
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Saeed Mahameed <saeed@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mark Einon <mark.einon@gmail.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Shay Agroskin <shayagr@amazon.com>,
        Arthur Kiyanovski <akiyano@amazon.com>,
        David Arinzon <darinzon@amazon.com>,
        Noam Dagan <ndagan@amazon.com>,
        Saeed Bishara <saeedb@amazon.com>,
        Chris Snook <chris.snook@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeroen de Borst <jeroendb@google.com>,
        Catherine Sullivan <csully@google.com>,
        David Awogbemila <awogbemila@google.com>,
        Yisen Zhuang <yisen.zhuang@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "K . Y . Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com, Jon Mason <jdmason@kudzu.us>,
        Simon Horman <simon.horman@corigine.com>,
        Rain River <rain.1986.08.12@gmail.com>,
        Zhu Yanjun <zyjzyj2000@gmail.com>,
        Shannon Nelson <snelson@pensando.io>, drivers@pensando.io,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Jiri Pirko <jiri@resnulli.us>,
        Edward Cree <ecree.xilinx@gmail.com>,
        Martin Habets <habetsm.xilinx@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Rob Herring <robh@kernel.org>, l.stelmach@samsung.com,
        rafal@milecki.pl, Florian Fainelli <f.fainelli@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Chan <michael.chan@broadcom.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Gerhard Engleder <gerhard@engleder-embedded.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Gabriel Somlo <gsomlo@gmail.com>,
        Joel Stanley <joel@jms.id.au>, Slark Xiao <slark_xiao@163.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Liming Sun <limings@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Prabhakar Kushwaha <pkushwaha@marvell.com>,
        Omkar Kulkarni <okulkarni@marvell.com>,
        Shai Malin <smalin@marvell.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Gary Guo <gary@garyguo.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
        linux-hyperv@vger.kernel.org, oss-drivers@corigine.com,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next] net: kbuild: Don't default net vendor configs
 to y
Message-ID: <20220131095905.08722670@hermes.local>
In-Reply-To: <20220131172450.4905-1-saeed@kernel.org>
References: <20220131172450.4905-1-saeed@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 31 Jan 2022 09:24:50 -0800
Saeed Mahameed <saeed@kernel.org> wrote:

> From: Saeed Mahameed <saeedm@nvidia.com>
> 
> NET_VENDOR_XYZ were defaulted to 'y' for no technical reason.
> 
> Since all drivers belonging to a vendor are supposed to default to 'n',
> defaulting all vendors to 'n' shouldn't be an issue, and aligns well
> with the 'no new drivers' by default mentality.
> 
> Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>

This was done back when vendors were introduced in the network drivers tree.
The default of Y allowed older configurations to just work.

So there was a reason, not sure if it matters anymore.
But it seems like useless repainting to change it now.
