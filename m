Return-Path: <linux-renesas-soc+bounces-28670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGE0AXrHpWnEFgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:23:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D01DDBF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BF683024A7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 17:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE5B426D1B;
	Mon,  2 Mar 2026 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kb3Nqe5R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C11A426D36
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 17:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471901; cv=none; b=RmMyQmIOV6HOANbT9sjbRoGKOJQT5P1Dc4tcAcCNGZJr18XcTPJj5Ja6CdOZjGdxcAxsn2SfRMHH/zPZsaUtOZq4pkf0QLah2D0eluJ1bx4X+whB3wkal/4b65BgUwsN/OMT2M2vy+s5RlkYuVHHYU6ogdq6n5LzJ1ZQsIx92HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471901; c=relaxed/simple;
	bh=+MqM9KmRITyYRwaK2vO3M8KAYNBFVTYRhLwmb87Tibc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DadlDj43IlO6TsZ1WhR6av1zs8wyrviJP2QNK9gx7ELHlpJoOJ97CiOpxsC5fNT6etRzbkSMkAmgIKmEKdMubg7mp+r4N4Cx827uW5xytsH4uAIonXZE4qg2fTggTi/YYCIf7mEAJkwwGdDi/ZaOqBicLs6F/UdO/7SjYbPSUgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kb3Nqe5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD6FC2BCB8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772471901;
	bh=+MqM9KmRITyYRwaK2vO3M8KAYNBFVTYRhLwmb87Tibc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kb3Nqe5RRQ6fZzn0hWpidUfbL2ksozo7iqaxctiNEtWQg41IQH7CybnHljjB6FoYE
	 tSqIamkvZDxigySxPoGdI/0koM8f95QpBE1nv/YQ6xf+CWYKIwIQT17nJnZKj9D1uU
	 gHmiMDtDSr6R8cgZGprDUbS0MDKyrdTvYRBJo4AKX5I3FqPu6dPUeUdM6EfGSah9/c
	 K7u5M5qykk2BStQ3UsxRnqWs0FXcuJhgCnawQcW6y5xsruO5RS0j4A0zGSRKHHFd/Y
	 ixHTWvP+28P17nLzxy813d5t+NivpygbdSHdkY8Wb8aGpAKPaQEClVjIjgG5G7dP4G
	 ZRjj3CL+wcY0w==
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1279eced0b9so1685440c88.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 09:18:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwnqvfRDVKFmzReR5w6JDgtdjZogjxOQsOEuj1W/sYQjyJ3nmRlrXcDyJpxreDTjEyoJfUQpziw4l7hpUE++2l9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMQd9e91j3owtY12Km0ZSAcyIzgn2FOoPQ2gJHRGWcOoLv7J5
	QxStLVpeIycTWSTBmy6QoK8ZoJ/gIPt33zUdL6Q28wqJkLQDwhimSwiSTkkXvG9O30zw7UcQuCi
	D8voafLmFC4KjEfZ7j/kEbRalVFNcXmQO7XS88OjSiA==
X-Received: by 2002:a05:7022:2524:b0:11b:c2fd:3960 with SMTP id
 a92af1059eb24-1278fbff709mr5725970c88.28.1772471900307; Mon, 02 Mar 2026
 09:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com> <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 18:18:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfwQm58Md+rH0gfwAdKf2mdtZ=2VRDzXQOZpGVcQgeyMw@mail.gmail.com>
X-Gm-Features: AaiRm50zY2ACynZYq07UnZgsPpbD86ujojZTOhhFyYjI7hbWVv0-GS9VJ_fMHck
Message-ID: <CAMRc=MfwQm58Md+rH0gfwAdKf2mdtZ=2VRDzXQOZpGVcQgeyMw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
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
X-Rspamd-Queue-Id: 592D01DDBF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28670-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 5:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 23 Feb 2026 at 14:38, Bartosz Golaszewski
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
> > --- a/drivers/soc/renesas/renesas-soc.c
> > +++ b/drivers/soc/renesas/renesas-soc.c
>
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
> >         if (!match)
> >                 return -ENODEV;
> >
>
> I still find it silly to add a call to of_find_node_by_path().
> In your reply to my comment on v1, you said you don't want to add
> another helper.
>
> Currently we have two helpers in this area:
>   1. of_machine_device_match(), which returns bool, and tells if a
>      match is available,
>   2. of_machine_get_match_data(), which returns the match data, if a
>      match is available.
> But there is no helper to return the actual match?
> of_machine_device_match() would be fine, if it wouldn't cast the result
> to bool...
>
> As there is no cost (binary size-wise) in having the helper that returns
> the match, too, I have sent a series[1] to do that. The last patch[2]
> is an alternative to this patch, avoiding the need to add a call to
> of_find_node_by_path().
>
> [1] "[PATCH 0/7] of: Add and use of_machine_get_match() helper"
>     https://lore.kernel.org/cover.1772468323.git.geert+renesas@glider.be
> [2] "[PATCH 7/7] soc: renesas: Convert to of_machine_get_match()"
>     https://lore.kernel.org/10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772=
468323.git.geert+renesas@glider.be
>

Sure, I'm fine with this patch being dropped and your series queued instead=
.

Bart

