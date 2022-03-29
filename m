Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845614EA8FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 10:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233755AbiC2IMj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 04:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbiC2IMj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 04:12:39 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC73024587;
        Tue, 29 Mar 2022 01:10:55 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7ABEA60015;
        Tue, 29 Mar 2022 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1648541454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NIWeVXp5W7Tm62vf3HbLfCCWgDNazWwRL2/kVsgxxvU=;
        b=fPwKcMracZgtVY+QxEkAB4PGiZlBSbk3ENnAi+LgEhzlNp2Um/GE2p5n0cwC5d3daLI/ix
        7aKmE6Eu1Z0ETiHkb3+CjIfGBjsEFAcrK4ZYja1FVBPwt0L2RCrdj+EnkvMftaOSkE6gIX
        2cjZuatijrYYM224DGEiYyxV9izW6Y9Iz469eRbi9M74cQ9GUNCz3LGfohPy9lNS3XoCG1
        giAC38DktbX6E9BcNb4GULiveRSFpv0j0cFlRceoYm8gFYEv2YU8Ento/jVSUDHxhoXlyZ
        WnLWQW/B6l/EMGsNuibAiBCxMN2y1+by54kCL4hy13lSnqjSti3KPp2FJFaBKg==
Date:   Tue, 29 Mar 2022 10:10:49 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v2 01/10] serial: 8250: dw: Move the per-device
 structure
Message-ID: <20220329101049.069a0b1b@xps13>
In-Reply-To: <CAHp75Ve-PbTMBdb6Y0TYdaOMDwsJ_2JVoKCkwCFBG=iUd8baEA@mail.gmail.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
        <20220317174627.360815-2-miquel.raynal@bootlin.com>
        <CAHp75Ve-PbTMBdb6Y0TYdaOMDwsJ_2JVoKCkwCFBG=iUd8baEA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

andy.shevchenko@gmail.com wrote on Fri, 18 Mar 2022 12:51:29 +0200:

> On Thu, Mar 17, 2022 at 9:56 PM Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
> >
> > From: Phil Edworthy <phil.edworthy@renesas.com>
> >
> > This structure needs to be reused from dwlib, so let's move it into a
> > shared header. There is no functional change. =20
>=20
> ...
>=20
> >  #include <linux/types.h> =20
>=20
> > +#include <linux/clk.h> =20
>=20
> I have mentioned forward declarations.

Why do you want forward declarations more than includes?

> So, this can be simply replaced by
>=20
> struct clk;
>=20
> > +#include <linux/notifier.h>
> > +#include <linux/workqueue.h> =20

And why these two should remain but reset and clk be replaced?

>=20
> > +#include <linux/reset.h> =20
>=20
> Ditto.
>=20
> struct reset_control;
>=20
> On top of that, please keep them ordered.
>=20
> Otherwise it looks good to me.
>=20


Thanks,
Miqu=C3=A8l
