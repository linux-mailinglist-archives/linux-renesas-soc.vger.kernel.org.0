Return-Path: <linux-renesas-soc+bounces-32668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPiqHQPnBmoHowIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:27:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A76354C675
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12D233036E6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 09:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7120742B75A;
	Fri, 15 May 2026 09:18:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D950942EEB9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836716; cv=none; b=nTxYwKaOZ4WS9mAkg77tjfPfxfQImDCSoiuDCDKJlOMUBq1OPQckT2fzsNSZ9LJwo/hPgFShqqpvmfiUjEvbQjf33YoqKXFAO6l5JgM3r61I1ZDnmp2pBiBnw7ZVfHg0vBrYYLib42biSoOOLsy0EqjzXxWwZN8J05aDbdfJH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836716; c=relaxed/simple;
	bh=iB1Viy49dwgZQTX+y7w3SFcgAMKGccuqAQu46bJf4/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/bOp6PMYLW67Mj1H3ZCimj6djl4En9FkF/REzlJv35Jescpx8QftyQpCf4L4pBQ4QOTDwj6HO+a4r22XTl/EjN/yssqF6KL6WyENVi1iq9VWqJoA66DgK2HvMSyWJHo7f75YMPXk1Shw0ZDkEri/WjFNq+LlbSumekgSCzWkAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-575124e716fso3211400e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 02:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836714; x=1779441514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/d2gVxHTTcyblRYszMKGX/9Z1RGNRy695iCm0kFujsw=;
        b=ZP6XpRRCkeNU659oYBIvYo3UIN0t41jx2S1gRdfQ2U3Mdr49Fq8zCDoDfQ79s27Imo
         QKmmcA8e88LfymGMmneZpQz1G1a7hRGQwoAQGeIemC/07r4EgNbUS8TeJ+/Ooz/uFPva
         7biS+wZ076YAtkAzC3SQE9pvKWLH/HQj5f6dVSLDEPE0eMt89huFlDi8PCFMOJiPop9B
         O+Qqtos/9EoTTIJ0j41VTwfof1WUHOjE8p9wVrxeBs756PSouNwuonYJMJYt3GLlyKaM
         Qqumg6ucM9Gh9mDuI5iLXu9ceIJ1RPYePdGvWl7tC8FCfslrJgnImr84xjulF3BHeSUl
         ngFw==
X-Forwarded-Encrypted: i=1; AFNElJ8MOGv+zik2ejvbJzfeg+PA3CLnB+hZx5i811X+nytIPfHLJGAw+2cD4XrI/PjWEERzFSxKGeiugRQTOTH21J3Y2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlASOEnTPrLIbSWQl55jyf9gapzA9P8jzops6l+JClKq7uRN+Z
	DO4V6pBjRCMy2FNOYJMzEYsrpgQTNy+tQtz+XSkL75xVGng6YKvPJTT57clBTUlX
X-Gm-Gg: Acq92OEMcWURaoWqNdss+R4OPOx2B6BzFliGZGEssEHhMqrAmDlAxDMCMmDg7oj/Q3F
	I9b4Mkc1ylHLZvyfXBUsUDxXzvvRezbHKef4UlVBKZN2YDDB/u1s6/jvjS2coOU/if+AKcM7vNl
	nEpCLFASDLnkDYWBfFPf16slLLKgQczAKQVqTmX73NV55tcrL58VDz6f1VNhjIaIVPFVjfV3SvU
	rjOV3be9SHnYZvb+3rl2j67Ky0juiOuWOuXTp5Xo+QpWmdKzjL9vxqwsoc5vEYaurZDfiqENycs
	NoE4adIPehUWrOz6UcdBeh/4cHz/e6LaCXX6sMBkh9+y2jEbpWp9wqPWLjUfR3LEek1CY2xsdMI
	BcLMXCP6JrGf4oAnd+825r03JFG0fbMqR4L76qRLn6wPG/03rOdyJpqItMPlBjNts+PRoCdsP1g
	es826mqNSWEZAoBNuTNDLDXgZlkEzr58Ah42v0nFyak8vi7vVu83NvfMJVvYQITwQmtBpvOjf1P
	Jo=
X-Received: by 2002:a05:6122:e468:b0:575:360e:600a with SMTP id 71dfb90a1353d-5760bfd3d8cmr1671259e0c.8.1778836713803;
        Fri, 15 May 2026 02:18:33 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f58eb0esm930232e0c.2.2026.05.15.02.18.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:18:33 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-575124e716fso3211393e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 02:18:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ889vHqlBG88csSngqhOune6vWoTtIwWiNpE9fDChn2cKGMUX0OpEm+GWpRobr08x1mGbilI2z0E3M2NZT9eGC9fQ==@vger.kernel.org
X-Received: by 2002:a05:6122:3a0a:b0:56d:3b69:87d2 with SMTP id
 71dfb90a1353d-5760c044d95mr1713766e0c.11.1778836713075; Fri, 15 May 2026
 02:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <130ce567f23fd6eef8f5fa7273480a0e3ff2d1d9.1777562482.git.geert+renesas@glider.be>
In-Reply-To: <130ce567f23fd6eef8f5fa7273480a0e3ff2d1d9.1777562482.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 11:18:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULm-CA_K=McNgpTuBQKN9LkKLUV2-omKqJDQrk-+P_0g@mail.gmail.com>
X-Gm-Features: AVHnY4KNLVg39QXS53njqiDNGaLHc5UV5aAk_Ncug2T1CtkhZF2d1ae9MLWbsYA
Message-ID: <CAMuHMdULm-CA_K=McNgpTuBQKN9LkKLUV2-omKqJDQrk-+P_0g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: sh-pfc: Implement .pin_config_group_get()
 callback
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 1A76354C675
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.996];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-32668-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Thu, 30 Apr 2026 at 17:24, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> When reading /sys/kernel/debug/pinctrl/*.pinctrl-sh-pfc/pinconf-groups
> while CONFIG_DEBUG_PINCTRL is enabled, the user is confronted with a
> seemlingly endless stream of identical messages on the console:
>
>     sh-pfc e6060000.pinctrl: cannot get configuration for pin group, missing group config get function in driver
>
> Fix this by implementing the sh_pfc_pinconf_ops.pin_config_group_get()
> callback.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on R-Car M2-W, R-Car H3 ES2.0, and R-Car V4M (more to follow).
> To be queued in renesas-pinctrl for v7.2.

Looks good on SH-Mobile AG5, R-Mobile A1, R-Car H1, R-Car M3-W, R-Car
M3-N, R-Car E3, and R-Car V4H, too, so will queue in renesas-pinctrl
for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

