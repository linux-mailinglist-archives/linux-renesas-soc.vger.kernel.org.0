Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDEC4DDBB8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 15:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbiCROfQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 10:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbiCROfO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 10:35:14 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842612CD808;
        Fri, 18 Mar 2022 07:33:50 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 53E2E60009;
        Fri, 18 Mar 2022 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647614029;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8lOUGQOnlujmyqKVP0r+cQLixrFJgyiaHwH43PeXgJk=;
        b=am/RZThV4nxuc1rCuP4WUqkPiFdNIXwe3+FGJQWPjpWd2EHFA3FI4DzPBU9l3rNuWuBtq+
        of28xaVNAeDKvnLUJC+Sje3hnKnMBBjDVig/37SdFJRUwvqIlC6ZM3Sssz0ob7Alc7kf3q
        S6Pkzgpzfs3DZ2TasR39Ye3tDwV5LinfPL8gKHw4ORUxyMGJHPoLRZGQZb/IRHMa/mJzE3
        Vu20EZDAFdjvu8w/xa/HDb87m21IxQkNI8KPYIciLPu4CFpWwobWOwkS0h9KI+LiPR3oLp
        Ih/AJnH4wmg0XVof3IAuwIK+aglBat0736VdN8WGowI5kgMUaegzeruWiX9e1g==
Date:   Fri, 18 Mar 2022 15:33:46 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-renesas-soc@vger.kernel.org,
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
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 05/10] serial: 8250: dw: Check when possible if DMA
 is effectively supported
Message-ID: <20220318153346.152b3ff6@xps13>
In-Reply-To: <YjSOFII3l+vz0q8L@smile.fi.intel.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
        <20220317174627.360815-6-miquel.raynal@bootlin.com>
        <YjSOFII3l+vz0q8L@smile.fi.intel.com>
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

andriy.shevchenko@linux.intel.com wrote on Fri, 18 Mar 2022 15:50:12
+0200:

> On Thu, Mar 17, 2022 at 06:46:22PM +0100, Miquel Raynal wrote:
> > The CPR register can give the information whether the IP is DMA capable
> > or not. Let's extract this information when the CPR register is valid
> > and use it to discriminate when the DMA cannot be hooked up.
> >=20
> > We assume existing designs either provide a valid CPR register or do not
> > provide any. =20
>=20
> ...
>=20
> > +	if (!(reg & DW_UART_CPR_DMA_EXTRA))
> > +		data->no_dma =3D 1; =20
>=20
> My question still remains: Does this bit is _guaranteed_ to be set when t=
his IP
> is integrated on all possible DMAs?

I'll get rid of that entirely, let's just hope there is always DMA
support.

Thanks,
Miqu=C3=A8l
