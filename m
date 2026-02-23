Return-Path: <linux-renesas-soc+bounces-28406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNSQHvtanGmzEgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:49:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ABD1774AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D27E73046E88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FF0246BC0;
	Mon, 23 Feb 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEhfoMxg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26163246BC5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854372; cv=none; b=M8k/iG/EYuJKZcKkPnLvS7VRvxOTWLZx6X8XcQ8OeFH77x/hz1gCjpiNvV5XOsGnfvX2bVg1ALS9RZHOKQB0IjbjkFHooJZm4j0gHNnF68eaB5aQTHfGDo8m0gksKsGb7et/t4zOL4YFRkgrvCbOmDW+7BHa4+zLdWI0p6FVhm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854372; c=relaxed/simple;
	bh=xHD4QsgF9yMDfM9DNpu+nmQETYKEDBFK3tSyRcSPFXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjvOtmb0Ea6LmC/K6bnNRFOyXdPza/AVOYBuFzbEDd/vMUqiHfVKhjo/9GqRM4VN0f2Pzcuh2eyR0PTWPGvOjrR9k7zJuMQYjqsr4QjfAyI4yFPyqHH6nsZ6eOx/lB7wJVg6ZenWrXA9xuJaaZ5sJRUZNTyK9t8bkyMn0Uzl4nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEhfoMxg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E916BC2BCB5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771854371;
	bh=xHD4QsgF9yMDfM9DNpu+nmQETYKEDBFK3tSyRcSPFXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GEhfoMxgLPcp6nwBkt61gmLigCTkVgwWzwT0WQNgF2v2B5l7cMU1ELQLt3YHmIdBn
	 5SAQ9FzxXxdkTsua8QRJaj+XmvK4QG19qdTYwSzCjypit9H1KiTPwRh7FtCZ6tkqcX
	 WXpeV/sajncXIUIIM0tJHwJ+863yKm8QK5ecZ7hYMEBA+EhmHfW947NBkxOv/P6+k/
	 5GU11vmBKyLibQb0nd9eewN2w9Z4NQ7gR1ADROg8pSR6Ed5Wd9ZTSFn/kjg+XTxOHP
	 BfaZYFe56E19NFL/uM6za8z+9EKP3PS01Q5PvG/36tELIOBRvrtFao503jbbYj73m9
	 ywb3HTeKvIDsw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59f850cdeafso4634962e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:46:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWH29bik+N+fY2zaQQ+asueZwRE7KHvo2LtXiGMKK8NL7MnPv9UvIn+jwTsZ1mKcps8lysJvsXW1upZNxl4gktelg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWu2G3LEj68aITXPpQoa6F+nU6wKafEGBSKGHYj6asb/Jaet9P
	OV/nQMBf05DcB7f8FbQQKUj82uezoOyWixO2yQIQ6CTpwfKEdhp5ooYOjCccNYQzOeTeQ5OWjvf
	qJwSxLYrMqtdhYcZjE8iUxyyZgdXCvKlLtNKY4T+Psg==
X-Received: by 2002:a05:6512:1553:20b0:5a0:ef6b:f613 with SMTP id
 2adb3069b0e04-5a0ef6bf704mr1540983e87.1.1771854370177; Mon, 23 Feb 2026
 05:46:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com> <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
In-Reply-To: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Feb 2026 14:45:58 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeC-MTzEOVw0j4Kq9T0bSXk2gKJr=jn2jO8tqfS7BEteQ@mail.gmail.com>
X-Gm-Features: AaiRm53YdoncmLlrYwWxzOjKhAAi91ZYzJ0VCyHsDsiPleMxR8Z5ZNNGKc2eDc4
Message-ID: <CAMRc=MeC-MTzEOVw0j4Kq9T0bSXk2gKJr=jn2jO8tqfS7BEteQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] soc: renesas: don't access of_root directly
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28406-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: C9ABD1774AB
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 8:25=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
> >
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Thanks for your patch!
>
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
> >         const char *soc_id;
> >         int ret;
> >
> > -       match =3D of_match_node(renesas_socs, of_root);
> > +       struct device_node *root __free(device_node) =3D of_find_node_b=
y_path("/");
> > +       if (!root)
> > +               return -ENOENT;
> > +
> > +       match =3D of_match_node(renesas_socs, root);
>
> I am not so fond of these of_find_node_by_path("/") + something replaceme=
nts.
> What about adding an of_match_root() helper?
>

I removed other instances from this series but not this one. I don't
want to grow this series with even more new helpers. How about
addressing this separately?

> However, in the previous patch you used a different strategy:
>
> -       if (!of_match_node(imx8_soc_match, of_root))
> +       if (!of_machine_device_match(imx8_soc_match))
>

Because here, we really need the match structure later into the function.

Bart

