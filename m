Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4096718F05E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2020 08:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgCWHid (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Mar 2020 03:38:33 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:45641 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbgCWHic (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Mar 2020 03:38:32 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N6bwO-1jKBgX1p9C-0180tc for <linux-renesas-soc@vger.kernel.org>; Mon, 23
 Mar 2020 08:38:31 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 3FE066503EB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 07:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZDfWNVRT7_7H for <linux-renesas-soc@vger.kernel.org>;
        Mon, 23 Mar 2020 08:38:30 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id E941964F930
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 08:38:30 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 08:38:30 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id A763D804FB; Mon, 23 Mar 2020 08:35:57 +0100 (CET)
Date:   Mon, 23 Mar 2020 08:35:57 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200323073557.GA4298@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <ebda055ae4c898b4ca29e518f89d8f3f4be4d27c.1584639664.git.alexander.riesen@cetitec.com>
 <87fte0lyjz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87fte0lyjz.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:uK3EKWAxkKOIjuuN+UpZ633KvC57Bydg2SX+ZitDbA7nusNtLqW
 AzV8TlGY9rdGObulQSoUBzHAO6lBm4L8VlxCHkHAzQkLuDtgCtEGPrjVGzJRCxoQ1GhLtI+
 cTOq7vqUbR5W8bZ6d2nqucloJmJC5KG6sDN4EeiNTwdR6KYcAJM7PZkWGn1rxCfTMf7GD5Z
 g6oDjEEA4OvZDi9OZFtig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B2gjrMKy00o=:E3iyDzX2MIbm/YnillenMH
 R6LX7/EPHSDgaSzow+Kcfc9LvOZqqMoNVrdQmkKgDdtFa4SLm4qee7Ts365sXGFXxpo0OG/g+
 XSLe1EdC0YlTY/yrPFsc2ZiNcuhE3HlWcKrUb0PUaGHJX/TTJEjMjg8crMlvmhHxjvmiFGZLT
 4YrGzXSNfNQQ2Ue4531Gwv1sY49EZLFbTsP6ia2Hh86OKVHztUNajl7B75/iwnLBvgsLqIeY4
 EinDm5joFen05t/YBzuVF1TMO9OM0pb0+1WmWOc0hD/zdtf2U7tIJ2F3Jk+YfKY12yM/S7r7y
 aoirdRrn6NlpD9ltsh9MAQbbn1w5q4P0a46jSbvDgyUQT1iUzkA7aASwdDm8VXQWdH2Lrte8T
 7wGx7oX2BkekFyM219x5Yss66y5O8Fmo683//bghp/QxOrytPZsZ6S3nY2f91pyQJhudC4RsD
 YpkGdM5vHuiy57rLRVYsx9c6ekED9UQiFPUBvyAAZ4TYg7sA4AvB5oeHaa1XwnFaWAAnaE7cU
 4hBUYW2c7N8TWKfrFJ7KQOoGnzU/UuLed46MC3F0aGi3RJsdygCxcLpRI1CFjAg2TyztjzuR0
 Jji0tcDu0P087Fm6npkuBDLRk8Zs4TNNjWap+ibWiHBj0JQNBe+C+JPUZAyzUhY6QJo06KGjy
 3Nxls0eW2V4mhz/3EfyhpDP+kWZzCamz+r+Oykzv+r+KeAwHTKx3haYyLpqviBIC16bSnRfVU
 pnBT88X5rrLHcKKXIyH9kFxvQj9BUnL64K3q5O3dLIdC6DYXuxBA/3hN4MeHc8AJtXtZY610S
 lXyslGXWZezCd/tVPrCGvDR0JR86EI8KkyDiYHsla0WyVPTNI8XAcrxcwf5If4SWZSNB5Df
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Kuninori Morimoto, Mon, Mar 23, 2020 01:12:00 +0100:
> > As all known variants of the Salvator board have the HDMI decoder
> > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > endpoint and the connection definitions are placed in the common board
> > file.
> > For the same reason, the CLK_C clock line and I2C configuration (similar
> > to the ak4613, on the same interface) are added into the common file.
> > 
> > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> (snip)
> > @@ -758,8 +769,19 @@ &rcar_sound {
> >  		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> >  		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
> >  		 <&audio_clk_a>, <&cs2000>,
> > -		 <&audio_clk_c>,
> > +		 <&adv7482_hdmi_in>,
> >  		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
> > +	clock-names = "ssi-all",
> > +		      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
> > +		      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
> > +		      "ssi.1", "ssi.0",
> > +		      "src.9", "src.8", "src.7", "src.6",
> > +		      "src.5", "src.4", "src.3", "src.2",
> > +		      "src.1", "src.0",
> > +		      "mix.1", "mix.0",
> > +		      "ctu.1", "ctu.0",
> > +		      "dvc.0", "dvc.1",
> > +		      "clk_a", "clk_b", "clk_c", "clk_i";
> 
> I think you don't need to overwrite clock-names here in this case ?

I vaguely remember something using the names and failing to enable clk_c
without the list spelled out...

I shall re-test though, perhaps it was my own code (since removed) using it.

Regards,
Alex

