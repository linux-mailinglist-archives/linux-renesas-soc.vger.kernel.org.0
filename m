Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5913AC8FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 12:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233387AbhFRKnJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 06:43:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:49146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232317AbhFRKnJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 06:43:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8F40613EE;
        Fri, 18 Jun 2021 10:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624012860;
        bh=97aa9h+v0rYjZf4kK6kzUPY706Shq0YBWoJvZidGtuY=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=U/DEuoneXf0sW5AiR03ACEfxxE+QNZcVHCnKIGSXTTIjjmWG56ozu5lr+bwB2FvrE
         G7HzMf3DRj9tfP1n8RJ9H/YrtMlwfHm7gZ6qwjEoo964yxTgf0cggYJdl2+JBBBg2+
         sWjiOgcDe4/D10m7qoTXZ+ii0Um3q2L8rbXfhjBa43/G70FBbfnrCQRjpjCk7ksqqC
         XI3JG362XNhijcRK8FemWpMzXvdrfqjVO9f7ywFmDBzxtwggmbY38b4mNOg4oVCldw
         fdBX6owB72i1Ad9a9J7LetwT5gSpACjgbY5s+wbY4NjWvTFHTDX8V6IRPX73/hKDJn
         y3513mhwVvpEQ==
Date:   Fri, 18 Jun 2021 12:40:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ulrich Hecht <uli@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
Subject: Re: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Message-ID: <YMx4MSW6H6pH7GIv@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ulrich Hecht <uli@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YKUf9TVcKetApd1J@ninjato>
 <461686971.488794.1622648414815@webmail.strato.com>
 <YMxWjsAQNt9DG0Ef@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vTTn4+9ekWgc4QDc"
Content-Disposition: inline
In-Reply-To: <YMxWjsAQNt9DG0Ef@ninjato>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vTTn4+9ekWgc4QDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> is finally suspending the device. I will also add do additional
> suspend/resume tests before I say Tested-by.

So, I could not find a regression. I checked that RPM disables the clock
between reads and reenables them properly when needed. Also,
suspend/resume works, even when the resume happens in the middle of a
transfer. No issues with bus width etc. Looks good.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--vTTn4+9ekWgc4QDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDMeC0ACgkQFA3kzBSg
Kbbxgw//ZhuXhhU4f8XYwqRGyfFgBUnfTZT5jJWOgMGYlR/5rUIQfOgKuoBJHmVS
nZ45llnzYxUeiylBIUhhGSclwZLOrzP0IEt6fY4PyTxj6v4mGWmWk06svC+33Id8
JhCMtiEYGh/QFaIaMRY0D9Ge8d2vRIxQgKjGPEfz7QLSY4WI29MWMMoC/ud7w2eP
6VL0+AiTJ7CY+Ngu8yjSnh/GosVli5m48wWb12PmYB6tJVS9sbUiolySBveG9A33
NrU98gBPvTMCQXeWl3ecBXKcBcMDHZEvldEJIvibuFLbba2FjflBeDdbHVgf+cPt
F2AVGA6h8lLduRzvFGQ1wxWgnJarurbLca/y5qmX+ElgZW2XiwYrPzjUuD5r+uN7
BpU95NMkMDKzSx2WNz/u9QveJS4kxG7B3ZMdYZ40+DCZ+DIkS4MyRMVoEo796YAU
1/RV7hLvK4cMmsX03BgN7SUmhtVceSrGmsT1Bmh4E3AnaWnLHLxdPM4pkAEOzYTT
f4hp0Yv85ev2XWrXOrY81pS9WHQ335n3weGGyqjoE0Oqi83/kOzZ9flY9zoFNEc6
T9BlBM4l1w3nkJOVPJJF+bZ6qrZVaSpRDIzhxxPn0ZuTxlEsrD4M4gTUVjfr9Q/U
NPJ8igoCPNuJMTTkQjsTzLypKW1yR4lSpoaWRmxtZIQHfPDW/ng=
=ZjyO
-----END PGP SIGNATURE-----

--vTTn4+9ekWgc4QDc--
