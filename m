Return-Path: <linux-renesas-soc+bounces-28390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC84LiRHnGk7CgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:25:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7017615D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B7AE302353F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 12:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9552B3659E0;
	Mon, 23 Feb 2026 12:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClSzMfw2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719D136073E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 12:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849452; cv=none; b=C6m3zI/Z0SEEAK8+QGf33/t578h7ZpiqQr1Yvp914K4vcDwaFcete2DLpXMc58fhQDEHyFELIMLfzwlWGJukOZYxH9d/4jV0MbXq+BePa5Y92ctUuAG1DOkAmT2NWXMF5TLHCZw/VVCiGMwI8kSGkV6zxlK/Mct1S91tpChOj3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849452; c=relaxed/simple;
	bh=XHFXKaxBhs6qPw8s6WYbor1MvvJGijgDWMApY68L/Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijIKIqe9CV4v6doR7F73+/TRPRLGCcCzZ83j6cgVE4ZZ7JX15Q6Pzk0l81+a+hhjhWPsSAb8VkAYM4+HPVm9aSkUiUAnLmS0xS+TtWOjKA8qR1bnPy+e6Va6hYPt/dqMhnG7FhlkazawAsVgk+c0cy8EBCLiodcRwPMpYYGQYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClSzMfw2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E4CC116D0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771849452;
	bh=XHFXKaxBhs6qPw8s6WYbor1MvvJGijgDWMApY68L/Es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ClSzMfw2KGoHmbmLFUNqTHr5b1P9SdFYE4875XrXSwHp9EVpJcT4cAVStfcNuJpJT
	 ywl4dHgQQJFGugpJybkmfUbs8tXr0PRNFva6SeKD2pY9cX9AfhjFt4hYVVJa91cTgu
	 LDuXa3L4pss8seTX67/Q/1RD8qwzkl/cAvdq8vIGL/a7UqaT6bXgaz93V/3BA2958k
	 vFmtE9yXjpTdbLVFMqhaAxebIF8A4jGHG4eobCg3trTYrPv8YlW/r4oyjPAZvoQXb3
	 Avo4KOx2SZaLrhq4oLam2WFQbMRsIU5Sav0kNCPoiXSfL6PKGuJ0lP3BgX/lXXRHWr
	 W3Hz8qqtvmfuw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so4248121e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 04:24:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGzdxZLnx7+UaiwtCDj43UZ7k8TSB3+w1SD9HHHf/BT229ye7c//PJHgEebuDzMvIEpTW7x08pt2f9sVlTSA1WUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySqh6X6d2q+A305lyGeCvTUeuGk1at3woqSUAKtJB2ehyIn2+w
	FKzGVuQ9hPjEmUdnRZqHM6w8ad3Lw5yL6W1qc/w7LjHmM+pIa4ymaxA7GUKIokw1Va/3IfDukaQ
	Xvh+t4U4fvb3W2g+cQE7kURsd/MOh8sswu32QcU5rqQ==
X-Received: by 2002:a05:6512:2316:b0:59d:d615:4b72 with SMTP id
 2adb3069b0e04-5a0ed9a83f8mr2281473e87.25.1771849450656; Mon, 23 Feb 2026
 04:24:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
 <20260223-i2c-ada-dev-set-node-v2-8-77018c536610@oss.qualcomm.com> <aZw-MX4NvafqUVsy@smile.fi.intel.com>
In-Reply-To: <aZw-MX4NvafqUVsy@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Feb 2026 13:23:54 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf1==xy31_cf5sNS=GiGxhh8vXzZS1mgPzsro+BmsGEwQ@mail.gmail.com>
X-Gm-Features: AaiRm52Edj1KUe1BtPU4aexOD31BhZqpGcyhXaRBZ1csZIdxbFf-D5NUM1cpEP8
Message-ID: <CAMRc=Mf1==xy31_cf5sNS=GiGxhh8vXzZS1mgPzsro+BmsGEwQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] i2c: designware-amdisp: use i2c_adapter_set_node()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, Hans de Goede <hansg@kernel.org>, 
	Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>, Hans Hu <hanshu@zhaoxin.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-28390-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 09D7017615D
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:47=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 23, 2026 at 10:08:26AM +0100, Bartosz Golaszewski wrote:
> > Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
> > This allows us to hide the dereferencing of the embedded struct device.
>
> This should be united with patch 2.
> For this kind of patches I would not make the split like this.
>
> But if Andi is okay to take as is, I won't object (this is minor thing).
>

Gah, I folded this into this series but forgot to squash it into the
original designware patch. It can be squashed in-tree by Wolfram or I
can resend it.

Bart

