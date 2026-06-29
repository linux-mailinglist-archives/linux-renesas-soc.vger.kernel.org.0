Return-Path: <linux-renesas-soc+bounces-34532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tSODBz+jQmpA/AkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 18:54:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2726DD888
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 18:54:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UtH5gwa+;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D109300B44C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 16:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600D546AECF;
	Mon, 29 Jun 2026 16:54:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D785466B59
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 16:54:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752061; cv=none; b=QVp9pVQe9n42IK7caAzcPYLvQ3u7Q9RIKRTfB7IT3pdgnDsWMStwaCacflzPzMghl/7S8iOltxVCXe7oz0B96q8NeGUf28knU5Vzs0LL/bnH6NwEItV2+NXjI7hC5Rwn+qvNcDHooWu3mPC7Cy1P8k4qlsOfqonzp9XvAaPVBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752061; c=relaxed/simple;
	bh=eE8NJJlLWJmGLS8Mjp0uHMgdO7h8J7DYtf3wXUf3DU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwmfKjFiapNmAPBxSb6YNRbdiywt1eSUY7ZxwLLBt0pbHyw1zLERClL3sOE0mgVZhnq2xwjBjiE0VLWOAD8WdKx5a9LDEyEotr5dApd6+mfJvYZHzWDL3yoj7KJ2TDDfvSF59/iO46z4G1QbiH+T90BedzssuhML+O156Sq4L14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtH5gwa+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502DA1F00A3F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 16:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782752058;
	bh=nrtvzAHL3u6/v5L5E9Co3P0QE5xowtwOQFIomSwMWjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UtH5gwa+U1zvJ6MiDKihq7fz1abrI92vBGcYoq95X9rWwvz5W22oGlu4vG8sTBX+v
	 lZvuZzP6DS79zjdwBazFvkl6XvoQbUodjizsh/Y5t56PyS2oiOkfYCx7wkLk7cdr+q
	 2NhTOPmDU9hdWHEJWT+FaK8smDYBGn2B+2GOFurQSd53ujUwxlBKe0UjPhBCgGA3QX
	 k22qz2Jmw2cBhPjOS+8yx0ottM8TY6XGd5Ka/4VbWDj5PV4d5a2kNIQXOJuCPPFOrx
	 MdEVXZTxj/5NUCsyS7s46Ae8fQuMQf8DXRbIUUrciT9U9mcW4df21f2qy+RvS22A4/
	 JmKSNxfAR6eag==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb36ed873so1401246e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 09:54:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoX6kTAZN1Y4rlPCBgH11lDjX52jp+VzxHPLxLZXnS7HoGqZm2+5+5kvLt90cDp0h+LsSmbHmUgg791houmrDpRiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBN3IHrrOA8lXFeTi8i91fbYHLxqhxt3SJr0pKyRVbk4TnHuQI
	Kh7n3WRIT1Im3XqypwhPKuEGC/dTBvaMBH51P2fsV90jLmAZPBZ518R3GR3NzF2+5g7jwM3UF9x
	r5j06pmxHwXLdttamkY8yfvd9w23petYrU8qsigOh0w==
X-Received: by 2002:a05:6512:3d19:b0:5ae:b97b:f75a with SMTP id
 2adb3069b0e04-5aebdbbc205mr24885e87.55.1782752056582; Mon, 29 Jun 2026
 09:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com> <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 29 Jun 2026 18:54:04 +0200
X-Gmail-Original-Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
X-Gm-Features: AVVi8CdXDDErrbJGCmrBnsO12t_UfV9Z0jI02dBWCQjihPCNNCZY7ROJGiFNTUI
Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[47];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34532-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.dev,m:linux-amlogic
 @lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF2726DD888

On Mon, Jun 29, 2026 at 4:58=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote=
:
> > On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> > <geert@linux-m68k.org> said:
> > > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platfo=
rms.
> > >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> > >> managed by firmware over SCMI.
> > >
> > > So why can't it be reuse the DT bindings, and be compatible with
> > > qcom,sa8775p-dwmac-sgmii-phy?
> > >
> > >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
> > >
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii=
-phy.yaml
> > >
> > >> +  power-domains:
> > >> +    maxItems: 1
> > >> +
> > >> +  power-domain-names:
> > >> +    items:
> > >> +      - const: serdes
> > >
> > >> +examples:
> > >> +  - |
> > >> +    phy@8901000 {
> > >> +        compatible =3D "qcom,sa8255p-dwmac-sgmii-phy";
> > >> +        reg =3D <0x08901000 0xe10>;
> > >> +        #phy-cells =3D <0>;
> > >> +        power-domains =3D <&scmi7_dvfs 0>;
> > >> +        power-domain-names =3D "serdes";
> > >
> > > Ah, this uses power-domains, while the existing bindings for
> > > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > > I guess the clock is the correct hardware description?
> > >
> > > Adding to my list of examples for backing a hardware-to-SCMI remappin=
g
> > > driver...
> > >
> >
> > Russell King asked me to put the PHY logic for SCMI pm domains into the=
 PHY
> > driver instead of the MAC driver where it was previously. Instead of cr=
amming
> > both HLOS and firmware handling into the same driver, I figured it make=
s more
> > sense to have a dedicated, cleaner driver as the two share very little =
code (if
> > any).
>
> I think you are mixing up DT bindings and driver implementation?
>

Ah indeed, but the bindings don't share a lot of content either.

Bartosz

