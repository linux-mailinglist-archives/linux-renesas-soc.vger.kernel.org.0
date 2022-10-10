Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF9C05F9ADA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Oct 2022 10:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiJJIS5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Oct 2022 04:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbiJJIS4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 04:18:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5817F5817D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 01:18:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BB29BB80E5C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2022 08:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C01C433C1;
        Mon, 10 Oct 2022 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665389932;
        bh=9gtZca0G5wOrOnYkkT/Ju/DCBL/URDOuxOu7XwEdzgg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BbP9n+JtApm6FWpBgeHCekpylsmikvWfe6AMYc2Hl5qIrmFHEtDRcL+H7LnD0StE5
         ouwojC+eKq+ZRuQPIEH+9JAU1jl+d81yqBgSTEN0LC/qTGwINSxz4R4PKJgvp0P5wq
         X9d/jgxJuMc8mzCa8M2MhuWKcuIuw1PoxVEgf7ukZJg1op1FQRVcUgcxsA+afBb+ye
         MbIrTfAMyTQpWDHv/Jh4kVRP+QMoLug+OMQ7+nLbZ8qp648nmINyCyd0r819ftV4dC
         mnw5jkU99yY1AAuBKUQ3bLhjc2KAUwFySu1HFptaY8bA0tptMU421VKv3HNZeH9cTm
         leGGMeZkvNUUw==
Date:   Mon, 10 Oct 2022 10:18:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a779g0: Add SCIF nodes
Message-ID: <Y0PVaG6OW3wQLQGc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1665156023.git.geert+renesas@glider.be>
 <20dc2d1985fef5fb432cd2ef0fbaaecb33743473.1665156023.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0+oCIUZw8hcIP6Bt"
Content-Disposition: inline
In-Reply-To: <20dc2d1985fef5fb432cd2ef0fbaaecb33743473.1665156023.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--0+oCIUZw8hcIP6Bt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +			reg = <0 0xe6e60000 0 0x64>;

"64" not "0x64", I think. Or we convert all Gen3+ to "0x40"?


--0+oCIUZw8hcIP6Bt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmND1WQACgkQFA3kzBSg
Kbb2Bw/9Gstu4vLTdasQwfB6Q1JMUZbtQj8zFB7IeY4PKPrSBNrdpImtB24/L0MZ
S7f2LqW1YMN4wO6MHm14sKoiBY+UkvifP1Y9nlaYhOenixqknU60ueZumOMHeqP2
bJ5zpccMZ0bGI+xVWtFJn/DRJQiMSnlLjl31ne+109BbpkX7n954d/lh6rUTDqk1
Zxkk3+LHjByIXVeEfKsDKgJ6g2zbeKJnQuWc5MnsJGpLa5A/yf+EVCn+cBczdcC3
E04ApOip9Fwr5JP2ROTxeWp/L+0iDTpEomr3Qb9kv+hQotOkalDHOJknhrG3A1Vc
nHBZlrFkJAfkMaAUow9UPMfkTI/xbhf7N1W3uwWzof0JH+1JekKsKXBp7W1FIm8O
zD6PQjfDcIwH5AZ99ABWUdKaWOfu9Wv8VcUzJjdL9MBUv6ksbI+1CbeMcWm/qowm
9NZz6xna3T0ciB+r8+6z3/GltVEWdodqCpAjoThnQ5kGl+1EjDgiAS+jf8CUhYrC
a5YCq1R7OQPvRbuYaugHXhfnz2khtJyVZQEZqEkCpGMJ2Is3cqwODIpteC6sUp36
IMNIvyqfnxhsNND8wRr2gL6mdDIPYKIoGd9eUNQ8o8I7b5OceutV5uykszYsem87
/V2ZghayUHnoTAdZzkUS9fOLpnSAbipOp6C6ysUPOlI5R9Ch0qU=
=rFlf
-----END PGP SIGNATURE-----

--0+oCIUZw8hcIP6Bt--
