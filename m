Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9AA5F9A6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Oct 2022 09:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232514AbiJJHtr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Oct 2022 03:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbiJJHtK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 03:49:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5636558F8;
        Mon, 10 Oct 2022 00:46:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 57E5EB80D13;
        Mon, 10 Oct 2022 07:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F42C433D7;
        Mon, 10 Oct 2022 07:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665387991;
        bh=gME83fhuFjH8EZ8DVJ3MZxJ4DjwSXa5AJpjHV+kVkcA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EFf+1TLAAZe4PVniG6YqgywEmPBaCF10OODazL1QTTLHmj3qbFwrK7fWQ9r1/BcY6
         fzAGFrm7wv9P7z2DJ0cqB2B9w9QtKqrsUNFJhAOY3Jiz3ttoQ9e/a2skpsraobTyBi
         4nG0t6fnKIGLPrkwJRq80PUJjo34s2bdPOPQERWqLLsUCRtlLtUItIJLs8ItmM8FJW
         qJZuRRXUSo0vMPL9YMecsCPuOTz1td5dmLMGL+dl3dc4lOBDXfdBVYo4Die4+pA3Mg
         /WOQjV4P8OlM9wP8EYV50p6ZZJa239wkBzpcOBNpEKMmvFwKFQlqoun/hTWeYdnBxF
         oRddSvAHut5hQ==
Date:   Mon, 10 Oct 2022 09:46:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/5] clk: renesas: r8a779g0: Add TPU clock
Message-ID: <Y0PN06dSfFi6NAUW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1665147497.git.geert+renesas@glider.be>
 <f2c1e2c5411b7bd6af726e6baf6e1efc354a7cdf.1665147497.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d2Se/esHAN659/ZB"
Content-Disposition: inline
In-Reply-To: <f2c1e2c5411b7bd6af726e6baf6e1efc354a7cdf.1665147497.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--d2Se/esHAN659/ZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 03:10:04PM +0200, Geert Uytterhoeven wrote:
> Add the module clock used by the 16-Bit Timer Pulse Unit (TPU) on the
> Renesas R-Car V4H (R8A779G0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--d2Se/esHAN659/ZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNDzdMACgkQFA3kzBSg
KbalWA//RNCKyytT4Xu3QZwYpy5WvqfoEmtnUrHP1XAuJI+M0o1xGi1lsGCX7NKg
h23Y31InEfar06yq1/vHD9Pwo+FWVKKxa8vj8ZMZSdUredVzgVI/bizA+E/WWsax
Wy905O0V5nFX9oVCFMV0XUNguc8nuNNa7C2AebF6DcurGtXbEC9g6frnVQf9oilz
hIpxxKLIZuh+PPa6blJGEojLqCUAzKJYhJagpZj/vNH1ozFkGvhTRG+AjjeZ0S//
DVvNQg2IpoBxoCi4YfkuvOWonuZLDZ8imtllzXz/xTyAfUPfiebghSnLAACvB0PL
ENvYsmmxQEfBmGecEgogxde6nBdIdXlD41uj0fbNiMqRhKPGJVa+mSdTzuSAY/1S
T2+04US5zfmthTkmzFYMH6rMAM+ESfKOyfodJEZMxwf1/N59yGhkfMYsiu+XuVJz
VWF9LHvpYNfLk3SzlWOrjLwgszrrYy3bv42XOl5tSvOCU2OJSYmhmncbxi9UdBjz
W29G0kw3ia0HFktYEzkuWjMEtIdr/UUbm8UUBm/Ws6o+lxP53YuN/7G1HQvzNXk2
gs3k2VMjVWNDDze3LRzHlMttyRd2eYfw7zNaYpsj4g+W6rHtS77WQaEAc5m9xwPH
UudTSqEeB2JLnIaWTjkRr+FvvTC5ZIU1PI8Kn3RNL+4IK6PYXw8=
=yGDc
-----END PGP SIGNATURE-----

--d2Se/esHAN659/ZB--
