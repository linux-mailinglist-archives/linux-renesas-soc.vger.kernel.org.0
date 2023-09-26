Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20B227AE71A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 09:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbjIZHsc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 03:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbjIZHsb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 03:48:31 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A90F3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2023 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=vWUk
        /owqPAc9rn+dBgFSidyBvqrXi0wO0/I+cTX4BiE=; b=Tuyp2nk92Q++RuRpB4Xi
        gXtnUsXJ9301//GRI7XViBwrxd8Yxg+FZQWN75CzD1oTITgK4lX+vFwCfXENQfsZ
        +WejGAt3ifWugBE66U1T0PadzbqU3dagvUFOSk3iVIM+GFVf6b7qdz/c55tsRd3D
        haMQAcWuY9KcOuIGtr/YMzjerqj8tn5TTRKwkxvpEZZ+mx2OrDsj5DiCQIytIADY
        AnE1q2urWqENtTczTwGUL67LCPn+LJ/VlnHv4v+5Xlm/1RJa8445qV35eWhmDynh
        eMFIy2AYKfSryqLmrtc33KSarVT4LyuSFnNBsx6F2G62sK9hFShflEaXkjGFi26a
        Ow==
Received: (qmail 2643083 invoked from network); 26 Sep 2023 09:48:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2023 09:48:20 +0200
X-UD-Smtp-Session: l3s3148p1@KLxnTD4G5qwujntX
Date:   Tue, 26 Sep 2023 09:48:19 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Extend SDn divider table
Message-ID: <ZRKMww5Lq9L+PDic@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230919123722.2338932-1-dirk.behme@de.bosch.com>
 <ZQtY+NHFzFBWhrZj@shikoro>
 <CAMuHMdU_S7+rgykqtvTVaSSO53zXGHNpiPJ=yzcF1GMf2QXvgg@mail.gmail.com>
 <ZQv4SY8VUXMZ600S@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9S6AoWx+vwR/NBlH"
Content-Disposition: inline
In-Reply-To: <ZQv4SY8VUXMZ600S@ninjato>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--9S6AoWx+vwR/NBlH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > An alternative would be to let cpg_sdh_clk_register() sanitize the
> > pre-existing contents of the SD-IFn Clock Frequency Control Register,
> > so there would be no need to extend cpg_sdh_div_table[].  An advantage
> > of that approach would be that it can handle all invalid combinations,
> > not just the few that have been seen in the wild.
> > (following the old networking mantra: "be strict when sinding, be
> > liberal when receiving').
>=20
> That sounds very reasonable to me.

Thinking further: Sanitizing a pre-existing value of SDH means also
sanitizing the value of SD because only specific combinations of these
are recommended (or even "allowed" as I read it). This is getting a bit
complicated. What about just applying a default value to SDH and SD
which is from the recommended set of parameters? That will also help
when probing the clocks. Once SDHI probes, it will modify clocks anyhow.

Opinions?


--9S6AoWx+vwR/NBlH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUSjL8ACgkQFA3kzBSg
KbYf/xAAqWLUyO4grTdseux/Bj/w2eQa1rsLYGPcLliLbBDeJAo7CfzUvaVTnILX
Wqz5a9Im5u1wCIfO4vXP/mjmqWh3REOpB2If0G0mFQcggvdh0eHLNdkwoGuzqCfD
mFgq4ow2Wz8I42zIFo8GV1a7bZXDfRf+8ep8sOl84SLk+ZbJNaGPQesP+YnK010w
MLNq2gN9JnDQQQw3Snawp2Ih2TtmKCYrJEgV+aeD+L1riZi1rK2v2Gq+s27ofTaE
AH5pZz8sbTWeBeR1Xzin09vvHnhUIyKMPQvsRpihc7ilMY9DM2TAl6JWc0/YyS+q
kp37IJ4LwdEWSqoF7NmjACOuDB6h+XF8yT3ZMQc8jK6xnIXPs8FaketACGLBDmF8
m5nZszi1hE72swxpLEPkePj2kCjpKBOy30JqCtGrc3TCXRJlQDv9s0XOf8HKoALR
ePqdUHeXkQ9i2ya0ZSlX+hxrkppiNCfYMRgDLI0g9++G4SfEaYF//ehOM6A9LC5J
2aZp2dtvZGzzo93eKVeQkMsyOEJmyIzhiQbR5vi7No3UXHcD80+2RH38WgLnek3I
spdZII+1zPH5E51hnBdvBbd8Tu5o0jcYAEEISgHufVsI2GxBROSkvIFhiGoYCtBW
8kphnrUy4/m3mOIh0e1GwB8ofY67l5p97Ju0hBZDEGDFv0q2vAg=
=kYS0
-----END PGP SIGNATURE-----

--9S6AoWx+vwR/NBlH--
