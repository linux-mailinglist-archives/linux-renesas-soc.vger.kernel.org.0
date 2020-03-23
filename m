Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B33818F10C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2020 09:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbgCWImt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Mar 2020 04:42:49 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39483 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbgCWImt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Mar 2020 04:42:49 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MeCd5-1jrYQa2eWt-00bIoh for <linux-renesas-soc@vger.kernel.org>; Mon, 23
 Mar 2020 09:42:47 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 759346503F9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 08:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FJXOBy8Ozq0w for <linux-renesas-soc@vger.kernel.org>;
        Mon, 23 Mar 2020 09:42:47 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 20F2F64C2BB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2020 09:42:47 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.4) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 23 Mar 2020 09:42:47 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id C14E8804FB; Mon, 23 Mar 2020 09:40:11 +0100 (CET)
Date:   Mon, 23 Mar 2020 09:40:11 +0100
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
Message-ID: <20200323084011.GC4298@pflmari>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXiG1upHQrCcuZgNLFOEoeDVcb0zWxh1BZZST5TOURDBQ@mail.gmail.com>
X-Originating-IP: [10.8.5.4]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7066
X-Provags-ID: V03:K1:n4I+xjlH0PAAW/yCyfihodwVW8okMUVhe6pQnZE+Aflclrtp3R0
 rxBkbRFAw00r2N4V3e9tIFp6lTMPAYNtTep2yonpaICC+bmVV8WV+O1QQWsPcIyN5hsRg70
 wpdu7IyU3VVHeuqnCYsc0LuOmj1jKb+dLmwSPZDttxQCqDcUIWp4fqsO/xi4p/Ri6BfzKkC
 kWLhOjoWsK2Gi2NUh9Pcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EEY+7eoxyyk=:HddKgGNGXJm1amGwuxzjCw
 X81ryop+wgApb6WbwQxgl3hgxJ8yO5cjzcehUwGs46r8jMkHaTQE8Rcr552FBC2p7NcyVICKV
 JzzP9D8Sa65vOkW7TTCydUVc8LzGE3M/62DNwx5eC+of3h85s6LXL33icY75hlbpx16/IiDQX
 cim42bTptXFyVuNMOhVfk+kA2MjA4qKsZPY6Dhi7W8ZMifOIXtuVkFs+oDklN31944eVqjceP
 NWFwsVQFUTtfto7CywNtWJbzlNbWbusuerriAg4ZX4/BArZerALTEvQUBNN97SAoys1UoQieU
 b7jvDVT9meL64+zNjZtCJ1xVURRYP8l1LBTt+BFnmzLO3qfTYL9PopYHzyRvfKVb3RspDqAZe
 9LVCdcjVEauX1bgaF0sEj28y8kayfpvgjKWHhhcbJnL1DVu9omOmHV+z2wPt09Ll3DJ+38dqC
 p9uuBEvY8ivehAA/dxcEnlVkiJpbGfRhMuoCBEasgOw4jvpEz0dJO+TXlmH+5QVDSDJMGP57H
 L/WieYCzG4VMn+z6V3WrEtwBE7CEn3RViSw7Con+xet5MIeewtSRLoS4FdvAwe/USQGcXkcVJ
 qnaZ+eyH4gFH8wnP/7el5nzDWnAAcqJyMwTCGZKtFyAv7Nbja6hoEzFz/Pw0Fq6ljV2hSIE36
 x/ZoYa81Luh9Yu0ume+gAqRzAASa8eCuaq6QH8FKn6XYNxJlNE+OfVpVzzLBw9lloomyJwVqw
 UbqHPl4reSfBcqhHvnapdhsIIQQ52X2fSjwI2+VPzbr6Zl2g4zftvI/B7wNzY9zr3AR5atQTF
 Uc8gIiEpJJsxkv9svSrsa7vLLkX9+G7e9tnyaq/ie4bXeqJUciXkNKfzvHJQHTySOTj6mEL
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Geert Uytterhoeven, Mon, Mar 23, 2020 09:34:45 +0100:
> On Fri, Mar 20, 2020 at 5:43 PM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > As all known variants of the Salvator board have the HDMI decoder
> > chip (the ADV7482) connected to the SSI4 on R-Car SoC, the ADV7482
> > endpoint and the connection definitions are placed in the common board
> > file.
> > For the same reason, the CLK_C clock line and I2C configuration (similar
> > to the ak4613, on the same interface) are added into the common file.
> >
> > Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Did I provide a Reviewed-by?
> 
> > The driver provides only MCLK clock, not the SCLK and LRCLK,
> > which are part of the I2S protocol.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Perhaps you mixed it up with Laurent's?

Sorry. I actually did: he did provded Reviewed-by in his email, and you
did not. I was ... a little overwhelmed.

But you really did provide a lot of very useful information and it did help
to improve the code. Shall I remove the tag still?

Regards,
Alex


