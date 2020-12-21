Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886B52DFA31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 09:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbgLUIyp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 03:54:45 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:63984 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727150AbgLUIyp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 03:54:45 -0500
Date:   Mon, 21 Dec 2020 08:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail2; t=1608540842;
        bh=VVBq5kEMeWXSfE2fNOxez/ovFm1GKzPzNKtAMGYpYn0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=WdyCTV/95g6te02oIf8Uq6IP0olpfGsj78DsjpCpOh+NZ0yulqoAFBiikwfckDFwP
         kpt9OfvJ7KA9ru5mMKl85EudU4R9NSrWxXCAMZKrMfEnSW3//WFxf1iBH9qMxk/Jgl
         AWpLs34AKTppCHJYaJjhxxmRuDuF33gotAhjXHy6cMscknvu9e4oRNR03HiJ/Sqttm
         6SAZgbSSXYpFssnlA6yzeOqsdx8067j7OqelVJAyuDaX6xq5OWWg1EhMG4phPnRlgD
         a0KuUmPVEgKoFAk1DKLjeNKVrOKBkhmByGOCyboUnFfFVd6Wk7Mn1g0hIe/1/bKmQ0
         8czccoVVrotqQ==
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/4] drm: rcar-du: Add cubic LUT support
Message-ID: <jcjTLLVHB6YkIMnDrAcghTdaSTrg30wbACbWLZXS50UBUzb5_X0o7dAlR-KzGhVkxfPyW4AuRm05z8miKa6V6gzToI9BYxWpDp1RKb7ZXnk=@emersion.fr>
In-Reply-To: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Monday, December 21st, 2020 at 2:57 AM, Laurent Pinchart <laurent.pincha=
rt+renesas@ideasonboard.com> wrote:

> I started having a look at userspace to see how this could be handled,
> searching for color management support in weston, kwin and wlroots/sway.
> All three support setting the gamma table when using the DRM/KMS
> backend, weston and kwin through the legacy API, and wlroots through the
> atomic API. Weston reads an ICC profile using Little CMS and applies the
> gamma table. kwin is a bit more elaborate, it also uses Little CMS to
> read an ICC profile, but additionally supports setting the brightness
> and color temperature. It however only sets a gamma table in the end.
> Wlroots seems to have an API to set the gamma table, but I haven't seen
> where sway uses it (I may have missed that though)

wlroots delegates setting the gamma table to a privileged client, to allow
users to set it to whatever they want. Use-cases include setting the color
temperature and setting the brightness. wlroots doesn't support ICC profile=
s
(and I don't know of a client setting the gamma LUT from an ICC profile).

> In any case, there's limited support there for color management.

That's correct.

> Inputs would be appreciated on this, for instance with feedback on how
> X.org and Android handle color management, on how 3D LUTs are
> implemented on other platforms, or in general on how we would like to
> use them. I don't mind doing some work in userspace to prototype this,
> but I won't have the bandwidth to design a completely new framework.

Weston is working on improving color management support [1] [2]. I think it=
's
still a little early, but maybe see with Pekka if something can be worked o=
ut?

Other than that, maybe some media players have support for some color
management and would need to blend in multiple buffers and standardize
protocols. Maybe look into Kodi or mpv?

Simon

[1]: https://www.collabora.com/news-and-blog/blog/2020/11/19/developing-way=
land-color-management-and-high-dynamic-range/
[2]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_reque=
sts/14
