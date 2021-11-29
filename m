Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF03461185
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 10:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345017AbhK2KCQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 05:02:16 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:41563 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233627AbhK2KAP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 05:00:15 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E353C3200F72;
        Mon, 29 Nov 2021 04:56:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 29 Nov 2021 04:56:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=m8TyYIsx9xOvR1vRNaFs/1pR+xi
        5e9uMtHXU0T6smks=; b=UAositeveOhIS7t0TSvqu8tJTLNoal89yynv1VexHYV
        +HXfNDsqQA3bf95fLcaVmnqK2Za0hGZzQv1ZFhVMOVLUcWIj/e+f4/Y1cHMzLmY9
        eO9y/8dBZh6nBN7y0BcdJxedxoD8pcXnS4j0iZU8ROuQ3GIan9O0GLf/4QtcFaWt
        3E5/mzE+azS8VTVfTEjb09UuuNS6AZWqAUYLXXP2f7z51VjMsZUqhEfahwOy464y
        bBGwRRQbk/8o9R/HgcoUyFHLjD+8g6QVK3zB0vSlTJ/PpIs1Eje5rVujT6bZTSPE
        hiwGrVH0J07Dxzj7fGbwELov8lI3+y7DBvq4rq9hSEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=m8TyYI
        sx9xOvR1vRNaFs/1pR+xi5e9uMtHXU0T6smks=; b=ge3jFCMt2i1gIL9ZWxkI4c
        76B9LmfwOAT84VoX1yL/VkTp2uE/Sx1l2MTj//vhmWlOPwlOcCY9ZiB8u82wLXJy
        ftmEt8STHDAnKSSjU3cRS73GE+13yscu/EIwTvRFFPwLuiAL3H/OsaxCQSivkNp9
        tl2vu4let1PMu98zyPhWKr+EzBwIiAnHF7CXzqFvlFLDH5+OQwT9gMSTLiadmgmd
        NKUetSlJf72DxlwDSfpOkXFYNQ3Mhaf8w+O6/25f+ZJuhzIOaoqpWEIIpDDVvdf+
        Na7/JY/HxyxVjcg85mB5XQKz2axdKihLJB0bm5XPp4ixX3xWazIk4dNjdlKNNEow
        ==
X-ME-Sender: <xms:56OkYTVB53wORVyPK1ixElvnpiP7-lG9MrdUMIlIfLW7Bk1dcW2i4w>
    <xme:56OkYbl93k33XYTnnWxqnJN6dEhWcepVLe-2nXEQP5zjsF8G5huRbRsMKuKtglu1T
    QuFX86y80gtI3Bnt-k>
X-ME-Received: <xmr:56OkYfYVnFjlgjrGv0tuaZCjIMP9NbViL-YbuxDvT_ADJvD8CUfFpNzPqHe0FbzXBuX0of1QTsOWKbNt-fmI61zn446An8dDDGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:56OkYeXJ283TB6CWI4TnY7iAUlg-CLOx-_J6r4My8s2d74FUfG23uw>
    <xmx:56OkYdl4WA_H_VZbvbzoye78aTYLHYoBYjZ3naNVGrqQWeJ9HPRt-A>
    <xmx:56OkYbcGMRyq2T4ci_b9B8BiZCbBqb-olnCj1T-LyV8WUNeKh6N9BA>
    <xmx:6KOkYTXotsx_LTg6moEL35gSVakb3bNWi_gYfL1iwIe_zJB8F0FLkw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Nov 2021 04:56:55 -0500 (EST)
Date:   Mon, 29 Nov 2021 10:56:53 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, emma@anholt.net,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/cma-helper: Export dedicated wrappers for GEM
 object functions
Message-ID: <20211129095653.s2psy7jioo4gbcks@houat>
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ngsbwmijeassbwht"
Content-Disposition: inline
In-Reply-To: <20211115120148.21766-3-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ngsbwmijeassbwht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 01:01:47PM +0100, Thomas Zimmermann wrote:
> Wrap GEM CMA functions for struct drm_gem_object_funcs and update
> all callers. This will allow for an update of the public interfaces
> of the GEM CMA helper library.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--ngsbwmijeassbwht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYaSj5QAKCRDj7w1vZxhR
xTnaAQCSOxr0EGxq4RfySbVOu+zRxX0vmXSKoHdMRVvyGOILyQD+OLSOazH7QBe3
1k/BjjbGOTA0xpCIRtRBQVShjGl1Jgs=
=vbmr
-----END PGP SIGNATURE-----

--ngsbwmijeassbwht--
