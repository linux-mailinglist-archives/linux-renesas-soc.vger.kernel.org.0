Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5117CA14D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 10:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjJPIKH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 04:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjJPIKH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 04:10:07 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04894A2;
        Mon, 16 Oct 2023 01:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697443804; x=1728979804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LxryxW2/hhg5ypvaW/Cj4cSwQFokyO6Tq8LSefAbk/k=;
  b=CSB8PP5yPI18kbGo/ykg5ExItroATlte2XyCTwqXQfd7wePmK00iHeHP
   1NCvsiNiTNOM1E9NYWbvgRKdWqRGhabMRf4PWiC7//sHJkKtLD0xLz3PY
   1b0BxkaQ1qXGzanDmeW8TO6uzR4THc8S5mjtlAk1Uvd5pF/sWRRSjT89n
   MCd9wOa6fYnC4LbfoJgzYahmhEM8MPKzlC9CYtwBwXMJwgDPnUclXEmPD
   6zZMRtXOm1xBYvE0X4u8ag1UGh1TY612uTuek18ZAo9N/sWXRQduxpOJ9
   ho7juRblPMw3ugqRauamXaGjO2OZJFPSGeI17xKT+DL49d3EDeznvFJRP
   A==;
X-CSE-ConnectionGUID: koRSwWUXT4OxCfE2jy4xWw==
X-CSE-MsgGUID: TT0ihY+ZRs62LenG9QLRYQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="asc'?scan'208";a="10028472"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 01:10:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 01:09:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 01:09:27 -0700
Date:   Mon, 16 Oct 2023 09:09:06 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: (subset) [PATCH v3 0/6] riscv,isa-extensions additions
Message-ID: <20231016-veto-fascism-117d9d750db4@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231015-qualifier-campus-97bf09059d51@spud>
 <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2aSpILo4o1Dz0BKi"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--2aSpILo4o1Dz0BKi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 09:23:23AM +0200, Geert Uytterhoeven wrote:
> On Sun, Oct 15, 2023 at 2:22=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > The first 3 applied to riscv-dt-for-next, I expect the rest to go via
> > their respective platform maintainers.
>=20
> I sent my last soc PR for v6.7 last Friday, as per the soc deadline.

I was going to send mine this afternoon :)

> Feel free to take "[PATCH v3 4/6] riscv: dts: renesas: convert isa
> detection to new properties" into your tree for v6, if that is still
> possible (I have just provided my Acked-by). Otherwise, I can queue
> it in renesas-devel for v6.8.

I was expecting them to end up in v6.8 since it's pretty late & I don't
really want to send a PR with stuff that hasn't been in linux-next.
Queuing it renesas-devel sounds good to me, thanks!

--2aSpILo4o1Dz0BKi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSzvnQAKCRB4tDGHoIJi
0opqAQCkGEm9sza01pNYywi64GPOXXffC76mu2+pYDNRMvk1TQD9F9k8KyYRCpaM
Dkz5LS8icM//L/crcLEMzZL4FaOsaw0=
=Wny0
-----END PGP SIGNATURE-----

--2aSpILo4o1Dz0BKi--
