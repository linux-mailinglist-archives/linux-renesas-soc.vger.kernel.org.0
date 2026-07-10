Return-Path: <linux-renesas-soc+bounces-35025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JVMvGva+UGrz4QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:44:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDA739360
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:44:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E4F23010C19
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 09:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FD23F6C59;
	Fri, 10 Jul 2026 09:43:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D303DC4A4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 09:43:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676599; cv=none; b=QezXKwiGiLVgbx9b3jZkY62hQPoh/bF3Vyz2a6EcWMPoMGMGoH2wUelmjwWwPojLfao9uatlLiWoai1EE9v2lknoOEMNqha9CS/xkMaJub1sHLaEGQ0Zo4gxgfkVXQhLSVN0QXDkowM3Ghwsad5SjYzqaIfaw9R68wCH5r3qHUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676599; c=relaxed/simple;
	bh=g8x9dhwFyyvlvTkxK6+R/6CliWApPEOeK/YoKDP+uMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGCu6/8mODuLkjrULL1ogM8dwKNvoj6dXP0/DbIok8sqBvxWtuEShwGo9iA+SXQtssRlm4X3D8+DOJ/C7LfVDMAbu3oajApCMWRc00ukq0DNBPiAYIJA/AULy5d5El6el3/lqWpERNS906uc1eDKs/ZazBV77/TpuZAOIX7mRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bf9466412fso664878e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 02:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676594; x=1784281394;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJUbLwMEIOBZTFEvOkGzQdLJGFR8K38bCJj4Tk6Zpnk=;
        b=DN677bT1GbEVoZ8E7CNFjhLyCRqWwUVtpi/LhYS1n49sw2aqB0mK3M4Y74QY0IapzB
         oeQtZS2BMe0TwnrKtjJnauCaoOTOVgW8rdoplhplyJLgNaJR1fBcBkl3sZ4pahkC4bld
         tJxt/jfAfCrXXIJY/d+i0WM4gMrWcRPu0k4jdnj1Koion5ZlPhR7PuzDQYZT7pCLsg6w
         LLiPC3Am/A8umvJeXawkACl8gODADhawCxsEH2nqYedXZ3gSwEe69BMy3dmYgIoRZjtH
         Un+4G/JxCi1OK7gq6BACH6coXvphX3tbJ00z5zZDLhzS9QxUXEx4hwmNFyn3LRJkifcx
         kejQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxutXIomt1MzIb9vk3NOvgdZiXgOD6QlBApmEGsHD3igkZJQXYjpvAsl8YKgjkMbrShnRiLw4C8hv/Q9duS+mTNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmpV98AIYdY3ZJ8WwOWMCDWiYn6G0ijlbWcASsPSm8liyl4k0y
	SsTL72aOy+Oxvf8VN3YM7T0SIUTAHj21fi0u/cVQTa4xHG1fcgjjqsq9rXpY4VAUjSg=
X-Gm-Gg: AfdE7cnA7NtkB0yOa0ScgkLsIYLeGsLKvOoR1MyUZSGcqhlLbFO/UQK/BeVNbjNzCSL
	4XDcME/QeBridvvVWDuGqb16g9VUDGPz1s70J4ZVE8aE3Jv7ml6MBgNhBh65Z03z+WBFpU6vDEB
	4yDYNKb56lahTREXbaNF4R6kBnLVjIMoyazIHGcUj6BjrOfgQc281LYSjJovLqK//UZPq/obUOB
	E+pUxaXkdKKxQXJm5DCS6+9j4AStfG2V4ATiPEmChOkCeyfdAhz6w4yM8FFGoshntsd1QkEY8BX
	HPVLdubDn7rvKe3MTU9TPAsc9W3egIkHt9Wg20xTZWGwKV4WOcpze0qdPmmUaqhyy0Pj0SQraJz
	2M4OoKsuL6Qf7/cFxihWxUqd2gMtcaGCBsxI2hLFfsHvIRn/Obl28Y4q8Pgs1/uMF99w+CWD2dC
	B7tQznkNF5/sukmQoQRbd5/Deo3b9hcWS2BQVLVMEauOLe80+G0A==
X-Received: by 2002:a05:6122:510:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bf75eabfebmr6474778e0c.12.1783676594369;
        Fri, 10 Jul 2026 02:43:14 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f8ed2adsm4668940e0c.16.2026.07.10.02.43.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:43:13 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-73a442f7cd3so152877137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 02:43:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrUL7838i9sOWrMMTMQ18jrmXb2LjSo8kz77GuXHdmaCrXJGHgoby1lGYmIbUw802Yk1/k81O4osIFr7KRKw9If6w==@vger.kernel.org
X-Received: by 2002:a05:6102:5494:b0:738:3525:43ff with SMTP id
 ada2fe7eead31-744e01c148dmr7640472137.13.1783676593488; Fri, 10 Jul 2026
 02:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710085744.430340-2-manuelebner@mailbox.org>
In-Reply-To: <20260710085744.430340-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 11:43:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZeNfzsN5=b_v4ociTYYxLUFT8YM0nLZ6FZE2y198U_Q@mail.gmail.com>
X-Gm-Features: AUfX_mwSwZvpHCNyboZJL6Dr0sUh2j3LLuURj3GixHiR77P7hS7W9LcUOCBov34
Message-ID: <CAMuHMdVZeNfzsN5=b_v4ociTYYxLUFT8YM0nLZ6FZE2y198U_Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35025-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:from_mime,linux-m68k.org:email,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4BDA739360

On Fri, 10 Jul 2026 at 10:58, Manuel Ebner <manuelebner@mailbox.org> wrote:
> Add ')' and fix sentence structure.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

With the patch subject fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

