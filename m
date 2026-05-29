Return-Path: <linux-renesas-soc+bounces-33355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF32HVEHGmrK0ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 23:38:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D32CE608F60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 23:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B7303090894
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 21:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CEF3BBA05;
	Fri, 29 May 2026 21:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuXh3riY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFAB336EE1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 21:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780090561; cv=pass; b=BdkUR6XRagxPoMzc26ZZdrPl5DN4drC/oA0sRhYMUmOa+e7C6rHGaYAcsDKctmWWA2RP40+1d4hCJH4NeIisNRMS91cmJSNviVlNsLro2I4sA1kRMFhEESW79Sp8v9feHJRQ+M2blsTc54W/ow+1Y05rt5YVo1981Ff2k3UtU98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780090561; c=relaxed/simple;
	bh=/p+Nhsf4ZHcEuShSG9PqsTYgsO2Q5b1iHPWMwcUaRfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0PLJncpiXrrnl3Xf8o2cGw+TJUCSosbNxUimGMkiqOYSrtD9RC9EXgd3+9Tfe8p/AyxXLQHhrnJaNJFlASIepeA2Mp1ZXAxfUgKNHmiPezOjUMV4f0tcw9ffHC+68BboDr0E8oVGNNhZ787XeGS8U6Kc9Cr2Uy5fd2gSCFXjo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuXh3riY; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso74969855e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 14:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780090557; cv=none;
        d=google.com; s=arc-20240605;
        b=CoPqqYoUaEO05+tdPZVmW+TrdEtOpZlHILe2mqDXGnul7n0QhLGNmdLr1XgpSJlqSn
         wvT4U0/Vvwm50KveIon+kcKqm07KkCdCx5/F2D5/t8wm0S1BIPtMK/Q6uB1n/ntpCP8A
         1bcFe44q+u3/tHGSuj1rdkgKcpA5qeh2RTwM/clDgO0Xata39jFmTOGjz8YISip3RfGU
         vnQGpgCMYVB2/7cvXlA4ApeRXDYY2gl7OajYiRZSzqZAwmArUO+ba6KIXhdUJIY3omDv
         0q0epyxkCE5hDrGZxg2nmzJF527nxniflmmtJ7jGddNzPCez7LU+a0dzu0CvPzZpUOWl
         OYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KdTTkoXA1F/pQA1Bi5kR0R37zi8RrCHvoR+ZJclo8dg=;
        fh=BRbZSUnWac7UN7xhBdNnianpBR2yBbpxRTKiDmSNr3I=;
        b=LJH7tViL1RAzZ3BrZEJ4oboDbc3P9s99wwn3Ej6w8vj2WPAX2d6nnJb7iXFUCewVrx
         QDp7uyKeTXjAWDtw3EZsJWi2yXGcSHgTfH+5W8c5EdfIDr9BK5Zub2ijjyCrZ0lyKoqT
         2QF2UhHrDNihUwpzPrI5UEKdfJ8V9TwXuCXLpIQbJJ53drUOnPQKCU3QxkvAi4da+P52
         k14dEd3atEGHrabZ0Byvv2D4/YgOhmr+k8YrhOVNow5TXS2BbF3uexCo1pefx0/jr1an
         ARzzsdITppyrlG+HFExtVzKz/xb7E6hwUPgE7VqTokcMis8dlrgVgDtzypiwJrQGS1ym
         D/fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780090557; x=1780695357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdTTkoXA1F/pQA1Bi5kR0R37zi8RrCHvoR+ZJclo8dg=;
        b=ZuXh3riYuRKmiglLiZybwLTG6wDzeqjQxb672Iacf4hLGeVfzrTQ/DHcvBTbIHV0YY
         Lcl7VpavH8c6gYO2uvjpsOvMHPKDB1AYRIr1ozEJtSX6Ql479ggd1yWtmgVfvJP56xvf
         nupcf0MqH6dDYuaHD7+25LEQgE/b1/yO9K6W0gKTW9viSsN+KmDvHB+PoTvkZyLx1Xbj
         x+pbVAd7yYjH/uYDPttcX5LGHp4BFDuF/HdJpH2dvXapUdYAoCv2nJK3iRqOQgB6SXEJ
         wr/tQeNTsVNEq2Os5ahKJydjEy3Q0DO5CQfOdiORKEqaYWow+02gBylbaazE6UFPxrcQ
         2E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780090557; x=1780695357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KdTTkoXA1F/pQA1Bi5kR0R37zi8RrCHvoR+ZJclo8dg=;
        b=GAqmU0+O2axSq0ZbdhjNERs5iam1airikdlJXo1nRgqHDPxrHq0NK+Csn4a0TEJGtE
         L923OjP4ohIgjzV+ooVZ1h4XdIsOTbec1CBnsL9WRwPV1eJZMCgk8FGbDzZIHp/Gp1xs
         mtpybWYSMp9nbjhG3LqiXY7Ux+SPkQlDX3Wi9/VBxAY9Irbt1+GRMiG3Q3ux/0apA4lb
         3nL/Pubi109NR10d563CKD+Xc5Q5LJ80oUfMAh6oVGU3t8MMOM9QRdprD4Pv6nhHoSpz
         V37ov/kzOuuGHz6WT0P2f+DAVwXjcM3rdbZDuiJnc5FZItc81KeP1QT/tsieX/hW2tH8
         tOyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8z/yxonrVjhW6CI1Npqy5DTKepvrzCnDRXmH3VPcc0HYYINIHtNWPXK7VuCI2XIxnlN3/QgMvuZre1dLcbSbuzcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+WlwFjiyHDkILlIxva3+phjA84VvlHvoYsw+bchmQB5eQcFc
	i9UOvzKqb5ohE1dxMGvhPmZKWCKtrJ6rz5M3d5xIYu5CbCPoQiUKyw3Ap+uL2OAIducd9GRHQLE
	funD5/iD4gF+Ob1DcX2vkFwq+JpVWZBUeuc1B
X-Gm-Gg: Acq92OHri0wzBeW4ZSrXaJPci43ysbkHvPmBhAj1VocKvIVO3UNvAgJ8IES8Yb1CXfm
	YJocQ3AlJwBmwdDo1504IBjEaRJdbon13HNQnprgO1I9cH9tBdMoyUq++Ufzd7VrAhmHQZDvBY1
	3wDrNwytsM9dm5sYya4E5Ld6JJdC3hzFZCOq8sHfd0pNmIbzV+VO4oZoj7g2uQuFJ3JdvQvL9J/
	XdrRDJRiNZuIUIlGGO5psDdVnlDk1K0VX+pCZOAlorCFCTGL6asTVeA1NfMBki4Zgr+nEOz9e8E
	BGjGAHJjw6S5ltBhFZ8uxqKU7hEmB1l+ZuOm/53RjICpYpnVok1R6VUufy7eoejqAYkzSk+upEE
	y/vSTUt+lUG8rH7k=
X-Received: by 2002:a05:6000:1285:b0:45e:7997:8b7a with SMTP id
 ffacd0b85a97d-45ef6b159bbmr2183611f8f.16.1780090556805; Fri, 29 May 2026
 14:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 29 May 2026 22:35:30 +0100
X-Gm-Features: AVHnY4J1HrehAlQEavxBOnGVjqVE1ymhht1RenFbTtp33jQ3RWkemXVxLG2IC5Y
Message-ID: <CA+V-a8vVZPaNYkzfncT_GfUyc0UtiSj+JpRnLt0u99z3oAvMaQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] rtc: renesas-rtca3: Various fixes and improvements
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33355-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: D32CE608F60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, May 6, 2026 at 5:49=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This patch series includes various fixes and improvements for the
> Renesas RTCA-3 RTC driver, including:
> - Fixing the polling condition when clearing the PIE bit during alarm
>   setup error handling.
> - Checking the result of the RADJ polling during initial setup and
>   propagating errors.
> - Correcting an error message related to reset control.
> - Fixing a typo in the documentation for the rtca3_ppb_per_cycle struct.
> - Refactoring year decoding logic into a helper function for better
>   readability.
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (5):
>   rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup
>     error path
>   rtc: renesas-rtca3: Check RADJ poll result during initial setup
>   rtc: renesas-rtca3: Fix incorrect error message for reset assert
>   rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
>   rtc: renesas-rtca3: Factor out year decoding helper
>
>  drivers/rtc/rtc-renesas-rtca3.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

