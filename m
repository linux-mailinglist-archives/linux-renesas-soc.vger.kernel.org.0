Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33A8118F13F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2020 09:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbgCWIwi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Mar 2020 04:52:38 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52613 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCWIwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Mar 2020 04:52:37 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MUXYs-1ipnj21wxs-00QPAb for <linux-renesas-soc@vger.kernel.org>; Mon, 23
 Mar 2020 09:52:36 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 3BB6364F4FE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 08:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id L8hM0DYvtx6n for <linux-renesas-soc@vger.kernel.org>;
        Mon, 23 Mar 2020 09:52:35 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id E8BDF64C61B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 09:52:35 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:52:35 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id ED162804FB; Mon, 23 Mar 2020 09:50:00 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:50:00 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 09/11] arm64: dts: renesas: salvator: add a connection
 from adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200323085000.GE4298@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
 <077a97942890b79fef2b271e889055fc07c74939.1584720678.git.alexander.riesen@cetitec.com>
 <CAMuHMdXiG1upHQrCcuZgNLFOEoeDVcb0zWxh1BZZST5TOURDBQ@mail.gmail.com>
 <20200323084011.GC4298@pflmari>
 <CAMuHMdXa96P+boX9HgGMBKEXLKK91t3Jgu-Sy8mP5A5--EeP=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXa96P+boX9HgGMBKEXLKK91t3Jgu-Sy8mP5A5--EeP=A@mail.gmail.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:MwGdubMlAYqxHzeO98H55gDBFvkkLJqQVvya5OdAfEFoPljv3mn
 uo/iVTevcIR0VUk22/sKBYY1isoi1j/qXM6cKLOEsSVznho9KW+K91UNN103IYtMpoehoWt
 lIM2Yh9rlAtF2l6AdaIdL0ds8hqQw/Gkt3sXCVZbNn9ErYFRCZKSIHqOrhM+iobNQoy0gDR
 3OHklhyhftUuD6UGFlPHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BEPYvfoi6t8=:CdSiNW/Ov56jBT8jw/C3qU
 dITdRkzrAKj/pBmy5Ciz6QW+mTr+61QdXP1t0+90AF/ZT7Hk1d+DQkTzXevzaVgLxJ7aE4AX3
 463QjtZlzGc2OWBJIsITP0kYEOxzFUPiussDRm6JJ2dakm7L64raMRM43bxyHC46eRp27Geoh
 i+tIi92+j1M+kS93Npaa+D1I59+ZEk/zc2n7bvX9MGfe/2rJu0C88zNTyK2nLDU0GUGKB+W0A
 sFbmujqbDtm0/1MScqGIZ9a2VJ2YNU7TZg0A5dqILJ1Q0BNpzFka/2NvoZbcoEY7gpMXbd4aV
 jpPDKBg9omFb+MQxzPwrlsjI2aiGaPcm6wbZZKSptPPFId8VDg0Pl9+sWVSmXLzUPbvTC8k4R
 mOtIeFfkfI2Mm2hhUquB3QKqB7QYonbpZb57bwSdeLk0+JPyPlf6XBPRFuq9Nj7u2rvVTJEoR
 XGD7Pypk4goctbKEmoaTpadbaxrv6ojIaVUVG+wKSYXeoYmnanMGIOUHZwnUiR3ekHObNE2Fo
 U183o8+2AkAQDXIOV6DzO7JHOqVWErHoYoT0Nix8cBSo/QCqDNG9CTRVkRmLT5BN+0xWZQlhw
 RplQXWEVjRPJ+3vTViNxS5fF9R5g+rwaBRhwd+KljT+++JXv+10DGPWlH2Z30TVmQUpjf76Xt
 n2Ju/1FQuW7UgrWls7PTyLpxIenzB01YO+C3Fnf3/J8Ut1ltVYwAoA8xMoUwDti7avyaF//oP
 +fF/wQaKE0fq3Pt7jVzYhueIPnHfr4tmBWCKLHG6/jYgrJ6jXf8FRELbJ2ayPkv1kWXm/KW8P
 FLscaVNhQtoe20GtRezLzQZF32+812oNVP4k/pX28U0XIbxnDS2SYDrXl+bYV5lZXROrJDC
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Geert Uytterhoeven, Mon, Mar 23, 2020 09:48:00 +0100:
> On Mon, Mar 23, 2020 at 9:41 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> > > On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > >
> > > Did I provide a Reviewed-by?
> > >
> > But you really did provide a lot of very useful information and it did help
> > to improve the code. Shall I remove the tag still?
> 
> Please do so.
> 
> While I can point out issues in audio patches, my audio-foo is not strong
> enough to provide an R-B, and I'll rely on the R-bs provided by others.

Done. I left the suggested-bys in the trailer. Hope those are alright.

Regards,
Alex

