Return-Path: <linux-renesas-soc+bounces-32342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJuYH0qBAWqebgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:12:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5DC508EB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89BAB30057A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 07:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A6125F7A9;
	Mon, 11 May 2026 07:11:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEC7363093
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 07:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483493; cv=none; b=QIlVLLKHUQqX+1kqanripzkuVrkwpuC7YIsybN3NrySS8lPEvXTeOEEmmKneUphn+MgoGwtpukmMmkg9T8pmGWZYx+/mXLZJUv+c3NCUsX0oeIdbMYso7sCLuvA0zVsa9JheZ4oy3lPyDkyO9ZAzmLvZwf3l7TvCEMRmlbc6F1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483493; c=relaxed/simple;
	bh=O0Um4gJrLPGzHaxOQVL384l150E1rq+F8gd24MkfhgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgMKvYXRnMlw70JER6h9/pp8Ro1yT6TcYgVCUNlNxPwQtiJg/g8UI0rs+AjN8Bb4AWCsEeYaI7riWn4KliHMAnFrT+nPHPd62/dh4rCiUY20ZtJlkjM2ahK9HL2/aXBJCZtPhEO82szMpzrzT4cTUVpDzAYLayLI85RFcjnBSgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5673804da95so1250547e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 00:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778483491; x=1779088291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kRYUpsuhYWuz84JGxnlH83ZqNH3dWqhHNFOtz4SaUPQ=;
        b=Py4BPZgjwS4E/zYhNzdv2CWb4pCoRDMjTAqeanvPpY17g0Y1rCf+4ah+9E37Q2e6Ua
         CVOGERTAvuG87YTWTaiNUjpbds9iGbVSmJWNfZ3QO2/911dNqZCrRcsP0YLUSsPEJCNx
         jaEHsRvmoSLnjgHudnfH7x2jXX+st5rhIzf+CYfTC7PVo2kx3eDFfaHcUDc540UWN0PR
         U9KCSSzdYkNDJvks0m9lqOtPAT8Ac9upcuj8kEhX3u+5QgyYBqMe1yNB29Z1h22Il6ry
         IMO9kaHy+gg8KWaPfGmyUEp0/kcmSArfugmMILRfVCNyyMZoeDH3da/F6wUSIDFcOmqT
         Cpug==
X-Forwarded-Encrypted: i=1; AFNElJ/2HV/YnvwXYjS7NQdOKvm9BjE/QlA2xP+o7AZAgxOOh/H/8k25iuZ10eaG76OukmC57N9DOfXmEw7DoaODeSsPWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCQYmX2+R7TtqT0HPYct0fhInnfk/oDDXFSaRpnZz2MEP3ztwk
	zAd8YfE2q/wqCr95wggddn/Sk0wU2ikQBACRGCWSR/1gL7lyI85+OAVBNeyQeBTe
X-Gm-Gg: Acq92OEpq+bePNgPlQFI66DAe2sN7MVr//4jQXpnX1BCZDz/XT0+x43SuES64Nvt1eh
	Qiul1Ox1Z+TabLOFIrAvcoRJ17u4gsyAvn6JYkfLBCkmQkb/M5izkifDDDgjb7lp0wLVdGRGpYu
	2qyyMHTlMWt+QAxdLPgN+ta77tKu7Y2rKiEUOWU1zIZTUMvmHSWsq3B2Iz4hMLWkTH7waagQArS
	ep4bIhfBbK74tKEbqayterchihP8badVUJ5tJPF/fEt2U4cEDUdTMQnnjg944bkgUPNWwPZan4T
	yUTmEAWlSz7pPZmiZg3wN4g08gVxZK35AyQAyidGarOlZ3ftPLr7zuU3KhRzfsYSs177nXAg57z
	Wzmn0PnAfddw7fW3nLEc2K7t0KF0LbWdNhciDVzGNA1U/mBjApaYUJPjBfNdz8BjFGF19Yt9sQP
	5HoufiHDUVcppd6BbQFAp++5W/rATBeQeEIvNMwjkA3+MqmsLlSCaif0RqHSdxbzfp
X-Received: by 2002:a05:6122:3a06:b0:575:3c93:fac with SMTP id 71dfb90a1353d-575593b5b71mr10052419e0c.3.1778483490755;
        Mon, 11 May 2026 00:11:30 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57576d13773sm6867683e0c.16.2026.05.11.00.11.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 00:11:30 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57513733658so1169577e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 00:11:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+RfWEsg+ss8qz3HDyxaCWrzm1TMaODuZ/Oyi6If9bwWThubWn+VXWXy1Uddemnh5AfMX7Y0EELBpmyLy9WCXsHiQ==@vger.kernel.org
X-Received: by 2002:a05:6122:e16b:b0:570:f670:587d with SMTP id
 71dfb90a1353d-575596f452bmr8339823e0c.12.1778483489786; Mon, 11 May 2026
 00:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510103017.613773-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260510103017.613773-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 09:11:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKkP8gAsLFzV1Z98zxx60OLiR_-7=WuVeihWwd8J_aeA@mail.gmail.com>
X-Gm-Features: AVHnY4KX4L2BgRpFKacIW6Wf2uX1AhP8UA3ovWs0KARjMtrfpefScdS90azHI1U
Message-ID: <CAMuHMdUKkP8gAsLFzV1Z98zxx60OLiR_-7=WuVeihWwd8J_aeA@mail.gmail.com>
Subject: Re: [next-next,v2] net: ethernet: ravb: Do not check URAM suspension
 when WoL is active
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Sai Krishna <saikrishnag@marvell.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DE5DC508EB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32342-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.863];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Action: no action

Hi Niklas,

On Sun, 10 May 2026 at 12:30, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When updating the driver to match latest datasheet to suspend access to
> URAM when suspending DMA transfers a corner-case was missed, URAM access
> will not be suspended if WoL is enabled. This lead to the error message
> (correctly) being triggered as URAM access is not suspended even tho
> it's requested as part of stopping DMA.
>
> Avoid checking if URAM access is suspended and printing the error
> message if WoL is enabled when we suspend the system, as we know it will
> not be.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdWnjV%3DHGE1o08zLhUfTgOSene5fYx=
1J5GG10mB%2BToq8qg@mail.gmail.com/
> Fixes: 353d8e7989b6 ("net: ethernet: ravb: Suspend and resume the transmi=
ssion flow")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Sai Krishna <saikrishnag@marvell.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the update!

I wondered what changed...

v2:
  - Add Reviewed-by, Tested-by.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

