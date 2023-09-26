Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64827AE403
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 05:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjIZDQZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Sep 2023 23:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjIZDQY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 23:16:24 -0400
Received: from sender3-op-o18.zoho.com (sender3-op-o18.zoho.com [136.143.184.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F265DC;
        Mon, 25 Sep 2023 20:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695698137; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=WVaSj846s5kVfCid4BzazZN5qETBeE3+qGpCglntM2DwKDW4CLO7xWlYTM5IqGfJqvkcpMPaFEzukPqcn7viuZOwVyyHF/lYTq1HwR0LneC9XbURT36l8aAsBYYV6p0vI1bqlzhGiBsVd7eGClQQB2XB2jEYlu6ydCguD3zIhxw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1695698137; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
        bh=KhI5QeS9PArzWK5Z9vvz4HtEovenQXgCmMyUThSuYlA=; 
        b=XHLK1ngh/pQjFZcJ0YKoIP3Qsnayx8RSLWJVQR5ztW4fNw6ZfyT8XBUkO6pgWC89ZPFaGtkSHWw5hF3BtR1R3TRN2CLtDeABKRbxkiaLRo3EJajw+xbkvS3Ws9RgBbaqElUCahdnSOhlpDjxhPbMeoVuG0Rws/kzAQLUzUltaqk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=icenowy.me;
        spf=pass  smtp.mailfrom=uwu@icenowy.me;
        dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695698137;
        s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
        h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
        bh=KhI5QeS9PArzWK5Z9vvz4HtEovenQXgCmMyUThSuYlA=;
        b=mP6rhCrJERuxPbH/UEN7gSJpjV/ppXL2KJw38qlvpwvVr8tiKdgPC3agkrYrXX94
        CuvQzZaPq5z3r+aC/t4Vktqwq1sWyTwex7fQ0kjLvFIVtSCPaVM7o2yaxNnJH+HcJVO
        k93z/SaMRrHpoIGo27Mtd8Ws5KnlIX4tmCsA2AxtS09lDRoMjhMBs/u5GnFTIgDUdr+
        yHJNsZta6W/Mhq4DWyJnGvoZ6n7C7+fg7J4WozghCA6vJOlFMfWE4r7OxnzRZYXtY20
        /a4347tNO4DiIUsMDTh+YLMbVuw7fJuM2GOTuAnbIykrcUnUdcyGGCFM/0yZhfJKWtg
        F3UMLiLRvg==
Received: from edelgard.fodlan.icenowy.me (120.85.96.110 [120.85.96.110]) by mx.zohomail.com
        with SMTPS id 169569813492220.156609859645982; Mon, 25 Sep 2023 20:15:34 -0700 (PDT)
Message-ID: <c80bf6710d8cc7a1c0d49d52ad6410d04c6a0858.camel@icenowy.me>
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new
 properties
From:   Icenowy Zheng <uwu@icenowy.me>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Date:   Tue, 26 Sep 2023 11:15:27 +0800
In-Reply-To: <20230925-semantic-euphemism-f0c7e85ac317@spud>
References: <20230922081351.30239-2-conor@kernel.org>
         <20230922081351.30239-8-conor@kernel.org>
         <f3b8d0823150797bde975a09b1faf6d3826d1ea8.camel@icenowy.me>
         <20230925-semantic-euphemism-f0c7e85ac317@spud>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

=E5=9C=A8 2023-09-25=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 16:59 +0100=EF=BC=
=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> On Sun, Sep 24, 2023 at 07:22:30AM +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2023-09-22=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 09:13 +0100=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >=20
> > > Convert the th1520 devicetrees to use the new properties
> > > "riscv,isa-base" & "riscv,isa-extensions".
> > > For compatibility with other projects, "riscv,isa" remains.
> > >=20
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > =C2=A0arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
> > > =C2=A01 file changed, 12 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > index ce708183b6f6..723f65487246 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > @@ -20,6 +20,9 @@ c910_0: cpu@0 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
compatible =3D "thead,c910", "riscv";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
device_type =3D "cpu";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
riscv,isa =3D "rv64imafdc";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ris=
cv,isa-base =3D "rv64i";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ris=
cv,isa-extensions =3D "i", "m", "a",
> > > "f",
> > > "d", "c", "zicntr", "zicsr",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "zifencei",
> > > "zihpm";
> >=20
> > Zfh is supported by T-Head C9xx with float too.
>=20
> You say xx, so just to be sure: Is it always supported, or only with
> some config for the IP (I wanna know if I need to look out for it
> while
> reviewing other SoCs etc)?

I think it's grouped with FD.

> Also, do you have a link to the documentation for it? English is the
> only relevant language I speak, so if the doc is in Chinese, I'll
> need
> some help!

Sorry, but T-Head's official document [1] is only in Chinese. In
addition, in this document half-float is listed as a "T-Head
extension", but the encoding matches Zfh. See 15.6 Appendix B-6 Half
Float (15.6 =E9=99=84=E5=BD=95 B-6 =E6=B5=AE=E7=82=B9=E5=8D=8A=E7=B2=BE=E5=
=BA=A6=E6=8C=87=E4=BB=A4=E6=9C=AF=E8=AF=AD) .

[1]
https://github.com/T-head-Semi/openc910/blob/main/doc/%E7%8E%84%E9%93%81C91=
0%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C.pdf

>=20
> > In addition, should X extensions get listed here?
>=20
> Yes, but someone who cares about documenting these extensions should
> do
> it ;)

Well at least a bunch of Xthead's are now documented.

Maybe they will get appended after this patchset get introduced.

By the way, how to deal with the draft V of C9xx?

>=20
> Thanks,
> Conor.

