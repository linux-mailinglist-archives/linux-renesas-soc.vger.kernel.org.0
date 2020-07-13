Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10CDB21D272
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 11:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgGMJFA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 05:05:00 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:12393 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgGMJFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 05:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594631095;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=XJcRgXwIN4Zhf0ACGBnz0pccsMgYq+8GhJZN/ONtY4k=;
        b=jPOJ22fJ8JgE/pTenBS3wd2vAjsMAFDKcFq0rRdEnsNlVUHFcEF+tHOydWG6yfYwby
        Larm6sK4NdWdskru5bXQuXO8Ielx86NYosI1JJftCC2ELpQFegEqIVgZaby+CxBzXA8n
        WIabfEbx0iUoZjqwBB4t+IgVxMPaeBf2RuUd7MXv0+FXaLOm3qS7akbwd+fu40kvI+eZ
        BxYWyOsAhF06M7U1L2611KAIspKPuJTEJbbXK80SK3X7Zx4yWv0cx5cvlXV7QSdg08hw
        4PcTJiOvE2/V27rYkS+ulkKQPvhyC2fNQ1UYFUvNjPQ6CISyuW8eyJ2jhYpAM+fRe5Lf
        iaOQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGk/2mpg+g="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.10.5 AUTH)
        with ESMTPSA id c08c89w6D94t5B3
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 13 Jul 2020 11:04:55 +0200 (CEST)
Date:   Mon, 13 Jul 2020 11:04:55 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Message-ID: <1915095320.397253.1594631095168@webmail.strato.com>
In-Reply-To: <20200713081526.GK1498036@oden.dyn.berto.se>
References: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
 <20200704155856.3037010-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUR6ouBg3LTqE80vUS1UMriXnOiVBoUpoL8SHyCAiFrWQ@mail.gmail.com>
 <20200713072455.GJ1498036@oden.dyn.berto.se>
 <CAMuHMdUfDzDi1ELwsHeCe71Jm5zr9+rGT3o_R+cyPRqiyax3=g@mail.gmail.com>
 <20200713081526.GK1498036@oden.dyn.berto.se>
Subject: Re: [PATCH 1/2] ARM: dts: gose: Fix ports node name for adv7180
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev29
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On July 13, 2020 10:15 AM Niklas S=C3=B6derlund <niklas.soderlund+renesas=
@ragnatech.se> wrote:
> The difference as far as I can tell is only in the bindings. The older=20
> 'adi,adv7180' compatibility string only describes where the adv7180 is=20
> transmitting the data it collects from an undescribed connector. While=20
> the more recent compat string 'adi,adv7180cp' describes both the=20
> destination and the connector. A good example as you point out is to=20
> compare koelsch with gose. From a V4L2 point of view the connector being=
=20
> described does not effect the capture operation.
>=20
> Ulrich maybe you can help us shed some light on this as you added the=20
> new compat strings?

Executive summary: "[Laurent and Hans] agreed that DT should model physical=
 ports."
Full details: https://www.mail-archive.com/linux-media@vger.kernel.org/msg1=
03799.html

The reason why it's only in Gose is that that was the patch series that rai=
sed the issue, and we didn't update the existing implementations.

CU
Uli
