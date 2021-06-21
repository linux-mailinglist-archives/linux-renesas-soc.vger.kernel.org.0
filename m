Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2433AE3E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 09:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhFUHMg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 03:12:36 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35298 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhFUHMg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 03:12:36 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id C044F1FD2A;
        Mon, 21 Jun 2021 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624259420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5m0iVoYDgordNTBtr/EcNJ2J1FOuGv0SNPXM6WL94yY=;
        b=IPRMhQ8PrMXGkRybmZaiUGf27HPLzx3Ockf/QPf32laZW7r+iEoWGydBa6HrD9LKnSZxag
        mm+0BDRMDaLJVmdYwaEYPtZ4uqy/adSYyFFJZSuYQ/z3tHSU6tFPecXxrl/m42iWeoT4Xv
        1Tl8tTAqIGzRNIo5aKLm66XANOXENqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624259420;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5m0iVoYDgordNTBtr/EcNJ2J1FOuGv0SNPXM6WL94yY=;
        b=rYcqTu1LfBdEI36WasoSScnB4kVkzC8WN+4Z1fvA0ugfbDaHKl3aT71EXoLxa4cRrYkDvl
        /6EqSvY5uD+IoRCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 7C0B1118DD;
        Mon, 21 Jun 2021 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624259420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5m0iVoYDgordNTBtr/EcNJ2J1FOuGv0SNPXM6WL94yY=;
        b=IPRMhQ8PrMXGkRybmZaiUGf27HPLzx3Ockf/QPf32laZW7r+iEoWGydBa6HrD9LKnSZxag
        mm+0BDRMDaLJVmdYwaEYPtZ4uqy/adSYyFFJZSuYQ/z3tHSU6tFPecXxrl/m42iWeoT4Xv
        1Tl8tTAqIGzRNIo5aKLm66XANOXENqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624259420;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5m0iVoYDgordNTBtr/EcNJ2J1FOuGv0SNPXM6WL94yY=;
        b=rYcqTu1LfBdEI36WasoSScnB4kVkzC8WN+4Z1fvA0ugfbDaHKl3aT71EXoLxa4cRrYkDvl
        /6EqSvY5uD+IoRCA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id h5NiHVw70GC2fgAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Mon, 21 Jun 2021 07:10:20 +0000
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To:     Tomohito Esaki <etom@igel.co.jp>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devlel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20210621062742.26073-1-etom@igel.co.jp>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
Date:   Mon, 21 Jun 2021 09:10:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621062742.26073-1-etom@igel.co.jp>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="S9N95scXUmHLEhoTHR8oPdrgimcVQbCM2"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S9N95scXUmHLEhoTHR8oPdrgimcVQbCM2
Content-Type: multipart/mixed; boundary="xZPPBxBixwOsT2lETaomCXgoCiFxTTQES";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tomohito Esaki <etom@igel.co.jp>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: dri-devlel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Message-ID: <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
References: <20210621062742.26073-1-etom@igel.co.jp>
In-Reply-To: <20210621062742.26073-1-etom@igel.co.jp>

--xZPPBxBixwOsT2lETaomCXgoCiFxTTQES
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.06.21 um 08:27 schrieb Tomohito Esaki:
> Virtual DRM splits the overlay planes of a display controller into mult=
iple
> virtual devices to allow each plane to be accessed by each process.
>=20
> This makes it possible to overlay images output from multiple processes=
 on a
> display. For example, one process displays the camera image without com=
positor
> while another process overlays the UI.

I briefly looked over your patches. I didn't understand how this is=20
different to the functionality of a compositor? Shouldn't this be solved =

in userspace?

Best regards
Thomas

>=20
> Virtual DRM driver doesn=E2=80=99t directly control the display hardwar=
e and has no
> access to the physical bus. Instead, the virtual DRM driver issues requ=
ests to
> the standard=C2=A0DRM device driver (parent) when the hardware=C2=A0nee=
ds to be
> controlled. The parent is modified to notify the virtual DRM driver of
> interruptevents from the display hardware. Therefore, in order to use v=
irtual
> DRM, each DRM device driver needs to add code to support virutal DRM.
>=20
> The only driver supported in this patch series is rcar-du. This patch s=
eries
> is divided into multiple. The first patch adds vDRM feature to DRM, and=
 the
> second patch support vDRM for the rcar-du driver. The other patches add=

> documentation.
>=20
> In particular, I would appreciate your advice on the following points:
> * virtual DRM generalization
>    I've only tested with rcar-du, is there anything I should consider t=
o make
>    virtual DRM work with other drivers?
>=20
> * Integration to upstream
>    I think it is a good idea to add virtual DRM to the DRM core functio=
nality,
>    but I would appreciate any suggestions on what needs to be improved =
for
>    integration to upstream.
>=20
> * dumb_create and fb_create callback
>    I think that the dumb_create and fb_create callbacks need to be done=
 by the
>    parent, and it is preferable to use the parent's callbacks as they a=
re.
>    However, since the dumb buffer needs to be registered in the parent =
and
>    the fb handle needs to be registered in the drm_file of the vDRM, th=
e
>    dumb_create callbacks from the parent driver cannot be used as is.
>    Therefore, the current implementation of the dumb_create callback is=

>    workarround.
>    What do you think is the best way to deal with this issue?
>=20
>=20
> Tomohito Esaki (4):
>    Add Virtual DRM device driver
>    rcar-du: Add support virtual DRM device
>    dt-bindings: display: Add virtual DRM
>    doc-rst: Add virtual DRM documentation
>=20
>   .../devicetree/bindings/display/vdrm.yaml     |  67 ++
>   Documentation/gpu/drivers.rst                 |   1 +
>   Documentation/gpu/vdrm.rst                    |  51 ++
>   drivers/gpu/drm/Kconfig                       |   7 +
>   drivers/gpu/drm/Makefile                      |   1 +
>   drivers/gpu/drm/rcar-du/Kconfig               |   4 +
>   drivers/gpu/drm/rcar-du/Makefile              |   1 +
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  42 +
>   drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  13 +
>   drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  13 +
>   drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   3 +
>   drivers/gpu/drm/rcar-du/rcar_du_vdrm.c        | 191 ++++
>   drivers/gpu/drm/rcar-du/rcar_du_vdrm.h        |  67 ++
>   drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  22 +
>   drivers/gpu/drm/rcar-du/rcar_du_vsp.h         |   1 +
>   drivers/gpu/drm/vdrm/vdrm_api.h               |  68 ++
>   drivers/gpu/drm/vdrm/vdrm_drv.c               | 859 +++++++++++++++++=
+
>   drivers/gpu/drm/vdrm/vdrm_drv.h               |  80 ++
>   18 files changed, 1491 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/vdrm.yam=
l
>   create mode 100644 Documentation/gpu/vdrm.rst
>   create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.c
>   create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.h
>   create mode 100644 drivers/gpu/drm/vdrm/vdrm_api.h
>   create mode 100644 drivers/gpu/drm/vdrm/vdrm_drv.c
>   create mode 100644 drivers/gpu/drm/vdrm/vdrm_drv.h
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--xZPPBxBixwOsT2lETaomCXgoCiFxTTQES--

--S9N95scXUmHLEhoTHR8oPdrgimcVQbCM2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDQO1sFAwAAAAAACgkQlh/E3EQov+BO
ww/+JSg2yM4DLoyTmdRGBmAqoTupW9z+mVAhODjxiLs4gp1OhiFbhUATISPKa0vwVijcB/7zM5On
c8D7xEPj7RHnrCE6P2nIZ4Nf/wNkUsvPioqrzqOUhG+Jmx4CD4vV0VBcap0RAr8ww/wfeRDpnjaw
XG57aPs2hQI7cXx73jyiJEoSVuNUqTajiZDzzBUnRpMJa+OeIivYw+0CKg80uB402eVyOFK3GU1L
Cl2s0uruISMxRAC8guQXhonzPiVf70Dq/8e/qIPb+4ZQ0JkA0eQmgfHWnbQ0Prmd8bnSbjUIizkF
bP80O04bZShSs4VKwXCWWjUrDskRcbLLm2xt10SKm3hrE3+Luh18IbWh2Woh7TBKLeJ+hVduo4n4
iRviOZ0snSeNxJp5PsdY+LOeLtmquyoJboDif1/VrMyU/eYEBgNOmGhgD6yETQWK2ThN3K61uTIs
ja/fV7+hneFNfocCT0BSaFV8YDsHixbtpzilY9Ne45aXgOE+v9WsbgRHqb4EUfJ3PUZsKnEsvh6R
nZgNLsANN9TovxFQ4770a4u2/1yhXzOC/rqokh4gwl3lQZYlfkiL6HFnkuVS2AOA4yG0SlDj1FyZ
8WPZycS/XjiRMHMEfWtaieTQ/rh43+rax698aG8qeRsqVlq/bZcNP0Y9ySgbNDsYninpxUX9Oemk
W7o=
=IgJD
-----END PGP SIGNATURE-----

--S9N95scXUmHLEhoTHR8oPdrgimcVQbCM2--
