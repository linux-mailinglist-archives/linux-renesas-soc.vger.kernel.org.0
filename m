Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676D24EAF3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 16:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237881AbiC2O3v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 10:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237202AbiC2O3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 10:29:47 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698D021C05D;
        Tue, 29 Mar 2022 07:28:03 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B9A7D200004;
        Tue, 29 Mar 2022 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648564080;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0Z3/Z+MiDKB23SHCkTBudovfgs8BlhNVJlGuARezJJQ=;
        b=O1MMVa9RabUcbt5PSTO8u6TEzs/SDjOQAwTj8IEgeMPieYFmhkmJYVzgTBSt/7rDMD2FJ8
        lAicfsq1txRXTjz+7MeWFngqAPEUniyzL4XMrp0MjpVnX1qaqu9xaVNjl0JQrc6V+ZpxBn
        Qj9wyVmWkMjFsGb6QkJ56n7tT0d7RtTqbLTTefG34UQJxjQi/D3X92NRqbXYGHE83yhxkT
        IbyXS93BmNKKe5LARpYnL42E2/zS2ejwmNYd/6di5gHirbBZvJpcwlet/8ewvPfLdGPLPz
        3ylh8GnCgKNJGwbpPVMkZf71Dzc+nheGhoMVLJfDQa1o1gV/7GJjvlXBzGP3eQ==
Date:   Tue, 29 Mar 2022 16:27:57 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v2 01/10] serial: 8250: dw: Move the per-device
 structure
Message-ID: <20220329162757.097a67eb@xps13>
In-Reply-To: <YkLpWexrf8RS5bfG@smile.fi.intel.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
        <20220317174627.360815-2-miquel.raynal@bootlin.com>
        <CAHp75Ve-PbTMBdb6Y0TYdaOMDwsJ_2JVoKCkwCFBG=iUd8baEA@mail.gmail.com>
        <20220329101049.069a0b1b@xps13>
        <YkLpWexrf8RS5bfG@smile.fi.intel.com>
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

Hi Andy,

andy.shevchenko@gmail.com wrote on Tue, 29 Mar 2022 14:11:21 +0300:

> On Tue, Mar 29, 2022 at 10:10:49AM +0200, Miquel Raynal wrote:
> > andy.shevchenko@gmail.com wrote on Fri, 18 Mar 2022 12:51:29 +0200: =20
> > > On Thu, Mar 17, 2022 at 9:56 PM Miquel Raynal <miquel.raynal@bootlin.=
com> wrote: =20
>=20
> ...
>=20
> > > > +#include <linux/clk.h>   =20
> > >=20
> > > I have mentioned forward declarations. =20
> >=20
> > Why do you want forward declarations more than includes? =20
>=20
> Because they will speed up the kernel build and avoid dirtifying the name=
space
> (less possible collisions).
>=20
> > > So, this can be simply replaced by
> > >=20
> > > struct clk;
> > >  =20
> > > > +#include <linux/notifier.h>
> > > > +#include <linux/workqueue.h>   =20
> >=20
> > And why these two should remain but reset and clk be replaced? =20
>=20
> Because these one are being used, clk and reset are not (the pointers
> are opaque from the point of view of this header).

Oh yeah, I forgot that point, thanks for the clarification.

Thanks,
Miqu=C3=A8l
