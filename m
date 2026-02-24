Return-Path: <linux-renesas-soc+bounces-28424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGkCF19rnWnhPwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 10:11:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E062E184520
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 10:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93C1B3092BAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 09:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F260F369979;
	Tue, 24 Feb 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJTwKXw3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3BC368262
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771924117; cv=none; b=AfjK8Rf4yfCY85nnuMuJuX+N9fFVFDuZr8lM3eOqyKzWupWG8+crbL08x59krJO0JLdS4Ubv/KpBxFOzAXb13y/KQz7ypdEn5dBfRtv9oynRCmoqETj9DaqlgVow65Ot1jECHxsCRlCiPMCzQ2xuYCRyrH6vU7LhicDKUTYli48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771924117; c=relaxed/simple;
	bh=Q9i5oBBNkQGmveB8LXq2i2SLSNV9fZ3TzjUBnqX7p78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jjo+r36ckhY1IY9BJmsJN+ovyoxtyVB/gA2prZs/k6KNafSo/s0NiOT+OCJFoFO8wcLBMsj8QF+zksWt+TMjo2hLGFFH9fyd+hEoOTn1QE7vx90vjM3k5Jp3wiAo3fr8wVoM33Dn88Adoi3YH8nY2l4zAS0ZkIYCY/WBxFp/MNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJTwKXw3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA5CC19424
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 09:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771924117;
	bh=Q9i5oBBNkQGmveB8LXq2i2SLSNV9fZ3TzjUBnqX7p78=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YJTwKXw34O+Wqua0RWL/aMV9BsRMcwBA5KpyFOn8jxYjbpA6GqjXw3K9vfxsK/C8X
	 SKg9lXB/uyIjFLDkGJw5iaQY014rXs0eP4uvIS1b93/bswppjr6z7b8G4TpH2Zz9En
	 oPpyqtKSzfz7Z9IHZy4JoSgbUSUi6Kq/P7t4wPjC9sC5otRlVpdKvd4c1ZRBfofLbM
	 +yL4RlGm1zxQITbfxgltEMUxxoVKi3drZy9+MzgZf3Un7Z1E/pXw+CwcOLvlq/qmaz
	 pwITrW2E/Q/FLvHVuYdO19Y0Qy5eC0TrgdQJon23qt8al/M5uhm2fgrLAVM85kXntr
	 E2l2n0sEA+vLw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-797d6f934e2so51379097b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Feb 2026 01:08:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOuolxMxS4vLcaPq7EWfcBnscFuukgkwgeYiKXhqWcpi44vHN6N1S1t0KUEK0MA+BVO2PRXl2yqzq1hOJ2oJLUjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhDK4/xHdCbJWGTFJpeeZa6cvmVpHeac9BCSwUqE+avdiy1k7h
	eBXqOl2iIYxkRGitQ2OfgqIIlFGUQl7kngYAV7KSwVeGkaFXWuuEis2MVIjhqbnKNCw/qBsb3BY
	BU6/8XIJl804ZKop0sOzmVoiFcrnGHiY=
X-Received: by 2002:a05:690c:3390:b0:798:6042:12f8 with SMTP id
 00721157ae682-798604216bdmr799927b3.55.1771924116974; Tue, 24 Feb 2026
 01:08:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:08:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=7WAdsXu0FEqMtH5_BhCEHdkFT=9jw9AFd9LD=qvX8Gg@mail.gmail.com>
X-Gm-Features: AaiRm508KnJDrZsc8mpEevIY_lXIv05mpcGdwG_GATsrRW7vePmDNcyZVoA28pI
Message-ID: <CAD++jL=7WAdsXu0FEqMtH5_BhCEHdkFT=9jw9AFd9LD=qvX8Gg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, brgl@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28424-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: E062E184520
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 4:19=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add GPIO set_config to allow setting GPIO specific functionalities.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Excellent use of the generic pinctrl backend facility.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

