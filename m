Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31EF818F12C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2020 09:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbgCWIsV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Mar 2020 04:48:21 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:38093 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCWIsV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Mar 2020 04:48:21 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MS1G7-1ioQkS2RCd-00TXo6 for <linux-renesas-soc@vger.kernel.org>; Mon, 23
 Mar 2020 09:48:19 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 6ADD66503FF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 08:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ekHu3jG6-iZc for <linux-renesas-soc@vger.kernel.org>;
        Mon, 23 Mar 2020 09:48:19 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 1E00B64DA1C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 09:48:19 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:48:19 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id D7DA3804FB; Mon, 23 Mar 2020 09:45:43 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:45:43 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
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
Message-ID: <20200323084543.GD4298@pflmari>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200323084011.GC4298@pflmari>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:KoNtz3KpwUeA1sqV2pw70raX7gWpSwlevvFedt8wSrrr7DbYfNy
 NOetr1rzgtRHxBD/gVz3fe9+7bys1LOml2GoLcidBHiD4tJnXTixWvQuGC1VxNUU93aaC7o
 rS2AiektauBkCBXvVJKsSJiLvtkfq2CWo8mRd6SrsxdG6mTI6LqWxFK9g58zBkLUFtzksIq
 bFNG/LvJ05y7V487+wcmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xGC/80zTlE8=:V2mbSLpnAhpWTSscUsUQzd
 FRUDsuIPbwePBYlmon7CM80H9xvMedTRnMASSkjg5hbersXpcQ6KavLWy/xJgfja4P5EDn6X1
 IYR8475aBIIGGJAM0HFw/0kVwnF2HDUVTCWNH773h/VVQBMkU3AsjaxY8NqIGw86GkOuaHnUj
 2PG+dALoQbXhoI3E9h3rMc7zSd/VItVIa9DEmYUMvJGy8sEtiBgPd7vVUTsl5VbLG96y8u0vw
 68Qzp+is77D51ndeI2HsOchELK7EAOQy2F0s8cZz120hTa+kwAakeC+F0yDH+8fPb7lEbvDUm
 IApagzBnsas5mk3ehER8mR410c5akqyxhTmKUxOXAFWWIUaybCZWSyzQACaomKPup5xB2REuZ
 t62pUU9XguNk2NohLQpXALU/c5TCf3OzXvREu+1BpTf0jjRM+wwRIv8ji1kzqoLUJpopJ1h3X
 OTuZ/qOQUyU+OuVzDcqxu8rOTj3mwim3gnZJuGkh6T+AQD+1vOBjt7HQA2Zk2rGZo1tABpsjM
 b3Fq2HEsS2N0FSWB+maKJGiSqM+EmdIk2tFGpuhal5Cz3niaI26G1aA9KIH4Nes++pyeP+YaK
 h0EdlJj8b/1XcWCWmYrJ8zjaN8myg7D90BsVEV8zH2jIyGub2vsu8nSCZRmB/i7sJt+Q+jjPt
 QJFUOhiX4DpB2+j9AAdlk2IHQ5Dg840QJwRXIRJkY1qj1qja9QZvl9R4amASaqTwcH4KVLd7Y
 BFN34wzM8Jz2Ye1jfrcpLmcUwapj7xVpsxlj0pW8txe7REbSjmwvDOG3aNP8d+56wLChzXlQq
 69P34iqYAXA4/dOuYmnVRWFCI9L891f+xSip5d9aHgtuxTRVogg4NEwq4rnEAzXi4CKp5J2
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Alex Riesen, Mon, Mar 23, 2020 09:40:11 +0100:
> Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> > On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > As all known variants of the Salvator board have the HDMI decoder
> > > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > > endpoint and the connection definitions are placed in the common board
> > > file.
> > > For the same reason, the CLK_C clock line and I2C configuration (similar
> > > to the ak4613, on the same interface) are added into the common file.
> > >
> > > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > 
> > Did I provide a Reviewed-by?
> > 
> > > The driver provides only MCLK clock, not the SCLK and LRCLK,
> > > which are part of the I2S protocol.
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Perhaps you mixed it up with Laurent's?
> 
> Sorry. I actually did: he did provded Reviewed-by in his email, and you
> did not. I was ... a little overwhelmed.

It's even worse: even Laurent didn't provide his Reviewed-by for this
particular patch (it was bindings). Corrected.

Regards,
Alex

