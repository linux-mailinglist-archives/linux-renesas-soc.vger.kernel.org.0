Return-Path: <linux-renesas-soc+bounces-28448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIihEgXFnmkuXQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 10:46:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E43DA1953EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 10:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5EF4A307816E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 09:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D999238F223;
	Wed, 25 Feb 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mT9Spqfg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BBF38E5C5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772012562; cv=none; b=P/J/FyHUVnTp0k9e4lXU3iHRxGNHbO84jENT2uc/Yzl53VH8QSDrYUtSCUms7wc89Tx+V4WVe8O7zVO++2FuHgwPE+6d8ItRQAwm8KdcCthJEGmZHPEypMTqzm151U7vJn5gRlBTi30q7wCSh6OUs7UO/FZ4kTo/hPUTn+PCKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772012562; c=relaxed/simple;
	bh=K9a2s9JYkj0KSLlC0p3v78WuyHO3yDxajztaUeqowf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBbhcU3ix600e9sTM9Nu6VkDf3diT+mlqxgPHIUKFRKujeQFl0ZviBXh1/7GKrn2kPmNjfVR+TsmRQi9OiYDQThQdDmWK/S10UTEWSs8+FO4VPFGIowVwLECS1FCt9KMsFEfCDUru0ht98dI2rk7qdf/wx8tJtYc+vFqT2O+Ttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mT9Spqfg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D48C2BCAF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772012562;
	bh=K9a2s9JYkj0KSLlC0p3v78WuyHO3yDxajztaUeqowf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mT9SpqfgCsu/X3E++A3RmEyNDeS1Jlb38T25+6EctL4aTNtrYmIn9sJwobi0Kjivc
	 SIWlIil8HD6rI4tZWkASdHUvWoNLME+BBS77ASy39EdP9AEAvu8Grv97sZx0mgt4gA
	 FeuVzd0nOinFN0twGSxBNd48CSosm2UTZtSO4BSCkLC9t3U6SY6VNPtrfdwBTtZPix
	 cjoD2KrAApoFMf/6vraGzPtSqKDsk0JAwdh9JUpg0jU9012elBvMgLfvKfToNyDphC
	 cRF+6q6DtW/u0Fl2wkp2IU3lxk1cSXZg3CgiNc7XIWbaJI8xW6WZRbGZZKtucy4U+G
	 mWWi1ENNudy+g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-385c2f88618so54671921fa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 01:42:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9k6501pcpJ9QVHtkCKtF3XZ/Ur9QqQQG4VcKOoajsA8fU1BWhRaXbc82z8cyk3EMWn25ChGt6yyt9REpgHPExVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUI/txVej7N9GMZHoBqRhFkAbCskT55Mcno/ZCNEU05bU3CHMf
	xo8wPFaLhWzYDZymF2zMP5B51t/3afMAig12HmVDNlY9QdReM/GtbyYJvrzuWFg3fbmQQrRchRq
	vEBHo5LGZSif8ZezR63u3nq2Mu29IPIcMa7Hm6+4TdA==
X-Received: by 2002:a2e:9e46:0:b0:388:25c1:d969 with SMTP id
 38308e7fff4ca-389a5d14de0mr32354961fa.9.1772012560925; Wed, 25 Feb 2026
 01:42:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com> <20260224183213.GA3239922-robh@kernel.org>
In-Reply-To: <20260224183213.GA3239922-robh@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 25 Feb 2026 10:42:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
X-Gm-Features: AaiRm52qiNgvNEan0Ja9tgnzlKTIzAcLn92f5zLzhmXEy4_h8wLWb64Qeoqf4C4
Message-ID: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28448-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E43DA1953EE
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 7:32=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Feb 23, 2026 at 02:37:23PM +0100, Bartosz Golaszewski wrote:
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
> >
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/soc/renesas/renesas-soc.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/re=
nesas-soc.c
> > index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10ed=
d0d58b064650085cf 100644
> > --- a/drivers/soc/renesas/renesas-soc.c
> > +++ b/drivers/soc/renesas/renesas-soc.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/io.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
> >       const char *soc_id;
> >       int ret;
> >
> > -     match =3D of_match_node(renesas_socs, of_root);
> > +     struct device_node *root __free(device_node) =3D of_find_node_by_=
path("/");
> > +     if (!root)
> > +             return -ENOENT;
> > +
> > +     match =3D of_match_node(renesas_socs, root);
>
> Doesn't of_machine_device_match() work here?
>

No, because we're using the returned address of the matching struct
of_device_id later in the function. If you think it's a better idea to
introduce of_machine_match_node(), let me know but I think that should
be done separately.

Bart

