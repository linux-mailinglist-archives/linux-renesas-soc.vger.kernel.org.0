Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A73B526050
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 May 2022 12:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242313AbiEMKmo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 May 2022 06:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353808AbiEMKmn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 May 2022 06:42:43 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29A7FD35A;
        Fri, 13 May 2022 03:42:41 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id EA78DFF803;
        Fri, 13 May 2022 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652438560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RCB50dRxYtKkpQt+TlUuVeUX5jQgvNYuipc9oj3tDHM=;
        b=os4MaqxcZPMofeGCFHgvF6hvXsOQtZWB1wI+6meTHw7CicnjuDzDB2fAFb3TWmyiGdY8js
        t5Cf18y3JU8PhgWmpPF8Z6nvJnGGZvQbEYIytxDG1dYWXGOpSJS/42SmvNQ7EJfgYkNZg3
        ULpX7sN8v/Yt3rQgCx2QzNWNlVCqqcJ4WIx4ggThDPFgATwALuNabrCrdTqV4Fk2/SEtq/
        dhtvkdmvXeCb09GnBSZJTukJhFoynvZ7S0QZvJ6rp5lcSWngl77Y8yztA/VoabAlg+95PW
        GdSadIG64jXD5AHWfbb1RhhioMRDwIaEzE85u58mJg5OrwdGJ3QntViOFF7bBQ==
Date:   Fri, 13 May 2022 12:42:37 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
Message-ID: <20220513124237.42dd6c33@xps13>
In-Reply-To: <CAMuHMdX9sE5T_anQgerQNh6qKoR=P8uL4SbPjvFPXfCuHwVqEg@mail.gmail.com>
References: <20220509154943.25422-3-miquel.raynal@bootlin.com>
        <20220512152729.244940-1-miquel.raynal@bootlin.com>
        <CAMuHMdX9sE5T_anQgerQNh6qKoR=P8uL4SbPjvFPXfCuHwVqEg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Thu, 12 May 2022 17:37:52 +0200:

> Hi Miquel,
>=20
> On Thu, May 12, 2022 at 5:27 PM Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
> > On Mon, 2022-05-09 at 15:49:43 UTC, Miquel Raynal wrote: =20
> > > This NAND controller is part of a well defined power domain handled by
> > > the runtime PM core. Let's keep the harmony with the other RZ/N1 driv=
ers
> > > and exclusively use the runtime PM API to enable/disable the clocks.
> > >
> > > We still need to retrieve the external clock rate in order to derive =
the
> > > NAND timings, but that is not a big deal, we can still do that in the
> > > probe and just save this value to reuse it later.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
> >
> > Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.gi=
t nand/next. =20
>=20
> Without moving the pm_runtime_get_sync() call
> (better: pm_runtime_resume_and_get()) before the first hardware register
> access?

That was an accidental move, thanks for noticing.=20

Thanks,
Miqu=C3=A8l
