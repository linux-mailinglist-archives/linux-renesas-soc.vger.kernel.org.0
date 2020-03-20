Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5655C18D502
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 17:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbgCTQy4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 12:54:56 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52879 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbgCTQy4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 12:54:56 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M72bv-1jCqjw0hd1-008ZaD for <linux-renesas-soc@vger.kernel.org>; Fri, 20
 Mar 2020 17:54:55 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 068C9650318
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 16:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EDcKS54uU7JL for <linux-renesas-soc@vger.kernel.org>;
        Fri, 20 Mar 2020 17:54:54 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id BF7E3650319
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2020 17:54:54 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:54:54 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 6E020804FB; Fri, 20 Mar 2020 17:15:39 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:15:39 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 07/10] dt-bindings: adv748x: add information about
 serial audio interface (I2S/TDM)
Message-ID: <20200320161539.GM4344@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
 <c9ff553f804f178a247dca356306948e971432fb.1584639664.git.alexander.riesen@cetitec.com>
 <20200319180125.GJ14585@pendragon.ideasonboard.com>
 <20200320084406.GB4344@pflmari>
 <CAMuHMdUdVb0LwZDx-MH2FLYYPvgq=uj_3Nrzo9obWAi-Q-2ZnA@mail.gmail.com>
 <20200320090339.GD4344@pflmari>
 <20200320095907.GB5193@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200320095907.GB5193@pendragon.ideasonboard.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:DnG3IK552sWuPg3h6hcU6AxlBnRd6LaAPecvmI6jgXkei3vKD+6
 iYOZN+/Qnn3MjiyUrmr6uWquYai1WLGtZeTax3WQWFmwoPHEvMSqU8hNgJn190uXdPufcuT
 FfpnER7sJReaXrhl5aFWWEbq27gzcqgJZRCP0HGEivvu2Ws0eX5s2X3V8j4E3ukOUaHzbVh
 tyVLLUM+iKEwg/xB/j3Sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L/1bk2AU31I=:CXmuV0cNUj8e+Rn1lG5lD8
 d74MPMzfEXNeLhntJqTyONxxZXAr19i0f0ldMXkLvbrrDo8SUtnryVh6onC5x3L4t/ouJCspb
 RUEjcp4tgr95m/nJgDLnujgERq3T05xYzLfKAmS7cI4lGslNRHecfGMdhJfQ3cvMkqlMKIEFR
 hupEy2ODbSHhHRP/KRoD3lIF+RH8hLSY7Cw9wsaacZ3RFvpZzyV/IJ/DE9PNhBkOuZQ/JvvrO
 rSPfOEBbWUoyJuQsR80NmGng1USEaVrkNz735uY/d0+I8kcb2RdNpwm9cfeWVXtISjhiYygu4
 pgCVdkfEwGC80jmFTIfDLwOfRafpMgoKRp9ytlgj/KcLKSbmo4qGYdUIAKRRDPtYj0jNb2owy
 iq9JytiGFy2ZSGIzEnjFNoE5EItsjogJZ773QDMaFK7hps7LZrA3I/gI6OR2ArwY+tAyof3Bq
 nWx3iT9NQABqZrTYEqxeian2/qiZa+yKqWAKuYquUkOZ5J4mOFgHKAVPidvnOu7nfinVw1Z0y
 CxGj3cJy0P4Y7ZSBjWtn0RIFql7SriQL4egWZxyUhuTsYKupNlf3P+0pzl4qmaSnWGA3tAhJW
 aBLPcwz3IvwkPkdv7fLRxllQwuJfiHWshAoOo3ckxvOBalYC+C3sO3YG7ICbMxCTgIXcREUB/
 GQ9zksIGlFBTIhBl4K2hcOvJoXa5wv9dhNx5Cq3NpaijGYdl1jJxvQzs2mbWCIX1zvIgkZwaL
 /y+kvmLspnTs4KQQNHx5c9zreD3BhuXN6lFLgjlgxosCrn5U3csgV13FbUo8pSitrwKwdhyoG
 fxEjVMqu7674WDYq7EkHY2VWIoe/AdZyYK/M0eubUli+YEH2PaqbmEFLoXMiRTYFVMglg2n
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Laurent Pinchart, Fri, Mar 20, 2020 10:59:07 +0100:
> On Fri, Mar 20, 2020 at 10:03:39AM +0100, Alex Riesen wrote:
> > Geert Uytterhoeven, Fri, Mar 20, 2020 09:48:14 +0100:
> > > 
> > > You'd be surprised how many board designers would consider this a cheap
> > > 12.288 MHz clock source, without using the I2S port ;-)
> > 
> > Well, I am :-)
> > 
> > Especially considering that the driver will not switch the MCLK pin aktive
> > (all I2S-related pins are tristate by default).
> 
> If the MCLK can't be output without enabling the I2S then I don't mind
> if we make the #clock-cells optional, although, as Geert mentioned,
> someone may still want to use it.

So I settled on just removing the option.

> > And how do I require it to be set unconditionally? By just removing the
> > "if ..." part of the statement?
> 
> Yes. For YAML it's easy too, the hard part is making properties
> conditional :-)

Converting it into YAML turned out a bit more than just reformatting:
some of the explicit bindings schema is only implied in the text format :-(

Takes a while to find out what is what.

Regards,
Alex
