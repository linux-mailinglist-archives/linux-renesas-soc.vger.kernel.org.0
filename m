Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54617CB128
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 19:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjJPRQg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 13:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbjJPRQ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 13:16:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C878102
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 10:16:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9E5C433C8;
        Mon, 16 Oct 2023 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697476586;
        bh=MRy3up7oqUohj1XgFS/GiBFKY4NG7WbUD1k/7sSM8yM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ipMf8FZsx8iTVB3wSbylZBSCHdrLB9w4rvDfkqnc8OEH92i+lx+zxbGvLA3SWLgf7
         inKovQXXDMyiOl88agX16f0oLzdYGl0f/kKBwYw79ppGjETfOyJ8krtmvDh8M+C7sR
         o1xcU2etDt1GGUk7m/x2cShFClEqOmPkkZT1XVfdJS5xgt6beKobBf+FlARHSh+9vt
         lP/OevPV6O3qMwS2fzL4p1WRYsP4pjlBRiAJHZ4IC6TVRZqftsbLYewdNCH3EIM0g7
         fsEq5bObLfsAlf2jYlRrxk6Kh53CEmpcwkdc9QoozbLHqM2eYAn9KDpqGNJSrXDFo5
         U0u0JM/pkIv8Q==
Date:   Mon, 16 Oct 2023 18:16:20 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH 01/12] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't
 depend on RISCV_DMA_NONCOHERENT
Message-ID: <20231016-outwit-bungee-b46cf212c292@spud>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-2-hch@lst.de>
 <20231016-walmart-egomaniac-dc4c63ea70a6@wendy>
 <20231016131716.GA26484@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n9y3/cEO82Secmi+"
Content-Disposition: inline
In-Reply-To: <20231016131716.GA26484@lst.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--n9y3/cEO82Secmi+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 03:17:16PM +0200, Christoph Hellwig wrote:
> On Mon, Oct 16, 2023 at 01:49:41PM +0100, Conor Dooley wrote:
> > Hey,
> >=20
> > On Mon, Oct 16, 2023 at 07:47:43AM +0200, Christoph Hellwig wrote:
> > > RISCV_NONSTANDARD_CACHE_OPS is also used for the pmem cache maintenan=
ce
> > > helpers, which are built into the kernel unconditionally.
> >=20
> > You surely have better insight than I do here, but is this actually
> > required?
> > This patch seems to allow creation of a kernel where the cache
> > maintenance operations could be used for pmem, but would be otherwise
> > unavailable, which seems counter intuitive to me.
> >
> > Why would someone want to provide the pmem helpers with cache
> > maintenance operations, but not provide them generally?
> >=20
>=20
> Even if all your periphals are cache coherent (very common on server
> class hardware) you still need cache maintenance for pmem.  No need
> to force the extra text size and runtime overhead for non-coherent DMA.

Ah, right.

> > I also don't really understand what the unconditional nature of the pmem
> > helpers has to do with anything, as this patch does not unconditionally
> > provide any cache management operations, only relax the conditions under
> > which the non-standard cache management operations can be provided.
>=20
> They simply were broken if a platform had non-standard cache mem but
> only coherent DMA before.  That's probably more a theoretical than
> practial case, but still worth fixing.

And this part of it makes more sense with the above use-case explained.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--n9y3/cEO82Secmi+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS1v5AAKCRB4tDGHoIJi
0uu/AQDsd+QvHSok4Q8k4HHYfsUMrdFaeTVLhvRpSi+kRG+LLwD/T6ws6vJoKrWg
ZkwzD5bj5QIZjaHiwVcDzL6nh9r1gAo=
=qQsV
-----END PGP SIGNATURE-----

--n9y3/cEO82Secmi+--
