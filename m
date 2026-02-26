Return-Path: <linux-renesas-soc+bounces-28476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDqZFw0VoGlifgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 10:40:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA27F1A39C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 10:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24C3D3121EED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 09:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831D53A1A40;
	Thu, 26 Feb 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGu5+ci+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4473A0EAC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098119; cv=none; b=WN7aL663zX+wXKKKWBQzyz7GSNvqF9JRJDtE/zyEz6/eMHChmDGbCcU+W7MFpqTljFKg7OjK23c0TeUMEbTih1WMKwJ2WiMYQUIBJUFDdvqD00dV7DepDL5Dog1xD/bdrf9tJxL2o0+iV8d6efalpzzOtLh2N8z3cTqvEygR61Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098119; c=relaxed/simple;
	bh=Q+JPGjs/pGTsOGNIOl36KuUbk8oNei+wKcehtvsLCRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBjSzK5qK9nY2qLaaZA0Mw//4Nu3q013UZ1s/CsKbcaSkA9cDaArHMNdJF1wUZvmt2tlQEwZfwzmhr7UTZwNf+L3x9wEh9E21VKNvWQhtsk5VlDnYdKzCkObJtYOsh8cOz3LKJ08JAi3wZW7lqaGaEzmfk1Hk4E97XJz25i/JZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGu5+ci+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44437C2BCB4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 09:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098119;
	bh=Q+JPGjs/pGTsOGNIOl36KuUbk8oNei+wKcehtvsLCRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pGu5+ci+Wn2JAlztc6J6f17nc1u7YqME6JKT+8WKxBgc0aHcELhW8ukVtK0us1QEk
	 vZNR+ptEg/K6oY7fx9VRoFz+7glIPSL8J/f3xTV38nfSLG2Pn+yOHDraiExxbpKF7/
	 RMy3y7yR6cPFN3QrnZsiNvy5AjcqAc72iEN6B5FcJuEqSOhXp2VLav781RZKXGrhyp
	 i9Dll60Oag+79Jj6SFxp8iQwslow7Q5Tc5X3tHYLya1ez1aOHjdGBcNxkq/3lzqwPX
	 wA2XfnV170zB6ymSkxYEUufb58p0kTvV/FvZXmY++w5oMjSHRFhKZm882IOP6064bh
	 MDBQX4QmjpAWQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a1007523c0so677496e87.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 01:28:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtWiG6HCZvlXkl5jcYzsi7r989H2XW6e5kVDrTfAOv2cIauFvg8Xhule7DyQwC48GKHkd1pO2ogZJFeDunnu63RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLT8atNEUypoL5TVJCLkgxZ1frVrbH8F20oSLijvNwVRuyKJce
	cZLDHn0mqL4CvV4dlWT1XkSq1lo9AS/agGmrePi3gdnG0FkimTyAg1hvZa7r/Seo38w1X1L/v45
	N4JLnw6EuAvWT0m9SDW77gkzPeHMfvGZSf0FJQK1KYg==
X-Received: by 2002:ac2:4bc6:0:b0:595:9d6b:1178 with SMTP id
 2adb3069b0e04-5a105eb321amr948844e87.40.1772098117903; Thu, 26 Feb 2026
 01:28:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com> <20260224183832.GB3239922-robh@kernel.org>
In-Reply-To: <20260224183832.GB3239922-robh@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Feb 2026 10:28:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
X-Gm-Features: AaiRm51IEGv2tkqYAUL_wlvSqsaBCZdXcGaMbPUU4umqiYT87HTd0LJXBirO8Tg
Message-ID: <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] soc: remove direct accesses to of_root from drivers/soc/
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
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-28476-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BA27F1A39C9
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 7:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
> > linux/of.h declares a set of variables providing addresses of certain
> > key OF nodes. The pointers being variables can't profit from stubs
> > provided for when CONFIG_OF is disabled which means that drivers
> > accessing these variables can't profit from CONFIG_COMPILE_TEST=3Dy
> > coverage.
> >
> > There are drivers under drivers/soc/ that access the of_root node. This
> > series introduces new OF helpers for reading the machine compatible and
> > model strings, exports an existing SoC helper that reads the machine
> > string from the root node and finally replaces all direct accesses to
> > of_root with new or already existing helper functions.
> >
> > Merging strategy: first two patches should be either acked by Rob or
> > picked up into an immutable branch based on v7.0-rc1, the rest can go
> > through the SoC tree.
>
> SoC tree is good.
>
> For all but patch 8,
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>

FYI Rob also reviewed patch 8 now. Who would pick the patches up? Greg
KH? There does not seem to be a centralized SoC maintainer in
MAINTAINERS?

Bart

