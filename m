Return-Path: <linux-renesas-soc+bounces-33323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIaBLOdKGWrzuQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:14:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C5C5FF0AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6D8F30059B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 08:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946912E738D;
	Fri, 29 May 2026 08:14:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8FE348C62
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042467; cv=none; b=RNzXbxhriSr0R7nUSe9dwroRJzmFBmyzWbD3MrIVKP/G9IvJNDFE/a5ltsCRXQlKEkS0dVVXB7okpvoyBZnTCpGCUbGGmzzuZuTzWjd4oJsZdt+FBs+l25Omf2Tq5wIFXwXg2X2th4H2VLDHAq5rXyFLBTzlx2Yu62dwr2odi3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042467; c=relaxed/simple;
	bh=Y3tFDGOX27JJJnxfVSciMFlPzK4r1dGUFB9Ph53hdwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+t9nKDeMsskcSs5IvTvIZ5Jws+56C3dy0NPoFXEcrcqG1Fp243QDiPCA3bgWDlrcnZpKW170qdBcE8XE08bip5VYmcgHmrMZosD/QAglsEGTfozHLbeHWVKn3F4PiqyZdt+6vtJ6zxW9rN219kK8hNBB+bT9JUUdbWC+MRk1H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so2035876241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 01:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042465; x=1780647265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJStG2WIPC1e68TWwqkfMru3S557AjBpOhwnAwKGQUA=;
        b=D4anOhu3yMxwLydXLhwhhWEsHrbuyUxNoiAFHN4VSQ1yX0XfM08ztPlG5N2CnbTbWF
         9V9lr+gqZFbD5+QQ0f5ITwV12dhmqBx0vljUB47w2L5FnOCPu4uXlFU6dDyTnBiC4476
         lry9TfwTL1grLGzJOy3OQaDFPIj9JJaY4v9owEV3QQHwMbOuYn5n6uV2frz7W6aRAyHR
         3G+ZJi/vGBzInKZtZ1cApJu7ac5dw/JKFYvGUb1t2/BbYqpwJtnUNTnFmI/HYxWwmrZi
         N/U26dvuIa/8sCF45wQ45FX4mr2QdsT6qI9t+qDjkqWE7Dam+qZxDj/hBWmgQTR3L8C1
         oCtQ==
X-Gm-Message-State: AOJu0YxSOtbXm+n3F6zJ8k54GYTeIgMaigv4RWqrr7SmmSBJB9+BWrpB
	b/cnfgk5atr2/qxqX0AG2hZWOS7hbck5U5LjfYIkaNnRb1Yp5qzGXqz3GDuXX0G4L0g=
X-Gm-Gg: Acq92OEj7nfajlFEKBzKhzwS1Ww/CW02s5a8FhHb417hnwiunmnbjTQcwBrF1WKHXst
	81z/kDF0YLG8AblhiHaw1MS0cdswO8kZB0JBH/ntivAB7acESyNF9T6c0s0pv7O1UJAc0XT14qW
	yqoG690N6UKpzhnPhNTAkuaw8G9t8SdPNcmJ5kA+S5tlX96SaNw1Aafcg+MudPdtBY4itHicXjM
	uM9v+mEStyRqLijjsS9lScvWc3qiJmTDTXtTMSsRPKsahB2umOdF09n1qk38hrmXnXY6q0f+htZ
	q8lc7cQiTDUFmgtFQGT4ve58nTQdaWbj01UBCGEaSEegmJQxUTGPrmze8+ldSOb5a517oPNv2DP
	/mPE4z+tG2vndHi29dmCLxCAHirEj6+BxveBc6ZbMCAc0g7O3Zb3OCvWFnsJ99OpcQl+0jl+5uo
	Y0h+306ytPDpfPxRhqKq/3vlbN1tebuquCXtRl6nd/HGuBPqItWhGttPS3Y7JEumtftY8QiUM=
X-Received: by 2002:a05:6102:689b:b0:634:92c:bdd0 with SMTP id ada2fe7eead31-6bf35f516a1mr554875137.6.1780042465114;
        Fri, 29 May 2026 01:14:25 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfb8cc3ccbsm571753137.2.2026.05.29.01.14.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:14:24 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-631333ee9e4so4331790137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 01:14:24 -0700 (PDT)
X-Received: by 2002:a05:6102:290d:b0:631:2f82:c3ce with SMTP id
 ada2fe7eead31-6bf39c09e7amr570462137.10.1780042464704; Fri, 29 May 2026
 01:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519075620.4128-1-wsa+renesas@sang-engineering.com> <20260519075620.4128-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260519075620.4128-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:14:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnRjDhD9f5EZRP1gO5DiJrnZgzcQh=e5fezXQqR7VF3Q@mail.gmail.com>
X-Gm-Features: AVHnY4I27OTuwWPIDMFYdlxFTyanu_PO8LN-IKVffMFD_4SqqejcyTvBtEHGd4M
Message-ID: <CAMuHMdUnRjDhD9f5EZRP1gO5DiJrnZgzcQh=e5fezXQqR7VF3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: renesas: mfis: add R-Car V4H/V4M support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33323-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,sang-engineering.com:email,glider.be:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 53C5C5FF0AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 09:56, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The above SoCs have a weird register layout for the mailbox registers.
> So, encapsulate register offset calculation in a per-SoC callback. Other
> than that, only a separate config struct and compatibles are needed.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

