Return-Path: <linux-renesas-soc+bounces-32888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC0EOcFFDmoM9gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 01:37:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E22E59CD22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 01:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E48D1300D751
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 23:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1553CA4B9;
	Wed, 20 May 2026 23:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDhVtNxX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E843C65FE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320256; cv=pass; b=FqQa3tQTI4u+LNX5m5pfq7Sc0LP+GX9blYf14aJzewsWge99sP0pnTQUq1Q9bVMhw0+8JiG/FNoW2E6aTGhotPwistBXv3mOWIOeQUf7bfJzxvt0HbcOSwkM+4qBMfAja/gFaYO4aGI6+5OWbFCRXDupP+stFkWELZtw2Grb4aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320256; c=relaxed/simple;
	bh=Sp6SIKeuA2uB6yGcJDbhDcgvTpERKEz2fYzJCywaX1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1p1M+OK6RINJQ6z6KZB+bjJ0rzq+6DayzPvflN1/gl8WCxDkF/5azGtnYG3mo9+K2tdvPKKKWGbKeIGF1PH3kONjX1macOp6T+u5ZYYfTDfW/qfXS5YkfpgDVoSiR29kRlCphJEKTZ0gpO+qX4CrwpfT2Fh+9BpETD5i5Mxnsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDhVtNxX; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cbe69b122bso16255016d6.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 16:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779320253; cv=none;
        d=google.com; s=arc-20240605;
        b=FtUhSBh8voGc1biHqeh1V7xypHVK6w0THW4sj+QtqPZMGErGpbk/D9DAzoUmfWpGo+
         f7VKgwR0J7n+xw1l8n4qdbFQ7OvwiGjbTCbB3gAgGTT+6cO2IbbEViesnXjU9oeYuLBe
         DHbt3yqT3wE1iKzDFrjFOPu532i7ctmxwIKWTu7rEtK3yjyX5JSbt9oNe0bCkv58CXLB
         Sb+qu/1zJbbTx3FH3bhFQEZIEggs3qmKQ9FzyP5efkDX5pwgJ/2CCbMVgBxclcrLUx4u
         DsMqqv4NXvVBUxeMKnfvHpepjhTx2P8SxXxu2U+W6E/NbjbjqLUm4ddTd4AJ01JsO5Sx
         gACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sp6SIKeuA2uB6yGcJDbhDcgvTpERKEz2fYzJCywaX1U=;
        fh=tg4MYQ8rZojI6Vl4b8HNf3VMpHmdW6LEhBfav2V5unA=;
        b=CLVXVqnbMzXGHYSxOqwlgEkvHjiZZar2/eiLievQNomcxYvDgaLQIBosfCdYOZuAGn
         aLoWo56zecVJprWBZlX00Ecnogo32Zy6D/91sQC8OTR7IjFpzq8ojRLVb9d3a5iFLs0R
         hBbhN1AxyhnLIFPWJRviENC6E00P/tDKaKeAsBYiRpj6hnCxwWqOXNv3uj48vwKgtRI3
         Vb8uvmVbrLhOeo7m1IunLhmlJWOqX/kVJeIhX6wD3g+0mcTzkOLKT4uiDusNA44tbjkB
         e3RYQNQXJMdQdy65luc2gs40IfQSOqEchR4SGYzJu9n9pBZ5pskHIHbG8NytIa642J7c
         KlPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779320253; x=1779925053; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sp6SIKeuA2uB6yGcJDbhDcgvTpERKEz2fYzJCywaX1U=;
        b=TDhVtNxXTZk2ym66zKAa7FT1G+IS5kFAXdbt7vcPCobuP4sfGXj348UwfdikxZwg66
         drmsPYbmAl9NRYSBwTWtk6+Ib4FHDivTFVs2fJe2+EY7kMMR+Y6pvSChI8Xs6L+dr1wn
         6QkoG+5dyv+htllrNQnWI83g8WYoxbZM7cxzMmLSRw/WfQbvxGAbB/g4gSEb38QxMHM6
         B4XBYpp3L0dCFRCTclZ38v9Dya0wbwU7IcAv99Pd6Vp6+eBiJ/UnVmqvzsG7gJhI5b+K
         wcJ/+kCS3+KA17gNdYJ3EKcWwnEof50EJR86AFyJKlXdrSuA2gaX1WCsXBF3Vtv0I2jQ
         /pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779320253; x=1779925053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sp6SIKeuA2uB6yGcJDbhDcgvTpERKEz2fYzJCywaX1U=;
        b=O05aPtmEhQ6r9zVa8pIE0urw7Di0iOjrT+NcZP1FIE1pr76DMxj5InvD65kFEAyOXO
         nSxO4B/HgDjovUJjLzTcOh98N3n0xDXmMvTbbm6fSIrS3C0Cwo62z2j2aUIDY1bAl0Oq
         M5m34NfeSp/hdje6d+shxL0RhWK+jlDkEayKW9uJbPE1JTSybRMz5Jeb6+72X6jjtV5y
         8dp2UKpDYP9o+c+KY5/DpoE/hsbuwxigH5uc70yolIWNbT0sSORgrmsgi0UhMrQ3MMsf
         rclK/oUFzTSWWmhZY8MmiULwulZl7HMXy7cZM2c07gEB36f6SUSlDGBy7oKRGDXPulVv
         KPlA==
X-Forwarded-Encrypted: i=1; AFNElJ/qAnXviexa57JIgKT4hvnWO4T6iS8cL/q/OjwNth7MWNA+L9BPLLDxJpO1inBlGZSuzjT79zV7TJbR572BhzIIOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPx9LNKfXe9eDCQkzj6T7YbTWx+PxHBmBxLNsig8P9S+ZFyA9Y
	1s7XeMeiZEijEanCCW8yHkuy+C8dFxB3caVdACcY/iHa3reqnCFLGn7WV6x5SNUfNHaQtH/MVeB
	9B0oXY44Bo72P4SyAG1NwOP1QbF4aAHo=
X-Gm-Gg: Acq92OEsgQxjU9kC54lbO9XGLl32na03+6OpveJkZv1Uc/eAyt5qdCF6wng/MH9A8Oe
	4SofRApQLgWe9ymPpIR6+R9WwZQiQOskNElkdATb3fY7JSddttCZEFUp88fzGOrKJxYiNvdfhE5
	pERjA31v7/ZqJD/o0sq7S9a68ZldZW35wPY699LVOKPDANv535s6DgOl2U0PCr90r5xdc8fqWdI
	JRQtAwlTlPb5YwaLmZdizui9hW/FHtbGT/xpCnLSvo75RdSz+TTTH0yBFmnFZIX+4fYNK2vlhSs
	V4m4Kd8c+n1f1Y9b5labkoFHB329OCkTRUDA/MgR/iTYvGEGZH+o4Tr3rCZrIfk5H+DNXM1SP9j
	CcZw0KJAQPNM6
X-Received: by 2002:a05:6214:c26:b0:899:f24d:1245 with SMTP id
 6a1803df08f44-8cc6e67627emr9539666d6.43.1779320253600; Wed, 20 May 2026
 16:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 21 May 2026 09:37:21 +1000
X-Gm-Features: AVHnY4Ie1EkZP4MVWC5BJhOzB-LRjbEQVuRJFLZbvO9ezWJOak9jMyGsYRj-ryY
Message-ID: <CAPM=9tx7aP08jEtHN5KOhekfky8Qn9U5LZqUybude3D3OVZsTg@mail.gmail.com>
Subject: Re: [PATCH 00/11] media: renesas: vsp1: Modernize the driver
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32888-lists,linux-renesas-soc=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8E22E59CD22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 12 May 2026 at 09:56, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series modernizes the VSP1 driver by using scoped guards and
> moving loop index variable declarations to the loop statements.
>
> Patches 01/11 and 02/11 prepare for the introduction of scoped guards by
> splitting a large function to lower the indentation level. As the
> function is called by DRM clients (R-Car DU and RZ DU drivers), an
> inline compatibility wrapper is introduced. The clients are then updated
> in patches 03/11 and 04/11, and the compatibility wrapper removed in
> 11/11.
>
> Patches 05/11 to 08/11 then introduce guards and scoped guards for
> mutexes and spin locks. There isn't much to say about this, the changes
> are pretty boring, but generate a nice reduction of 148 lines. I advise
> reviewers to apply the changes and use 'git show -b', as a large part of
> the modified lines in 06/11 and 08/11 are just indentation changes due
> to scoped guards.
>
> Patch 09/11 continues with the introduction of a helper macro to
> simplifying iteration over format arrays, which occurs 6 times in the
> driver. Patch 10/11 ends the modernization effort with declaring index
> variables in for loop statements to avoid using index variables outside
> of the loop unintentionally.
>
> Patch 03/11 and 04/11 touch the DRM subsystem and depend on 02/11. They
> could be delayed by one kernel release (in which case 11/11 would need
> to be delayed by two releases), but I would prefer merging them through
> the media tree if possible if there's no objection from the DRM
> maintainers. I don't expect conflicting changes in the R-Car DU driver
> for v7.2. Dave, Sima, could you give your ack for this ?

Acked-by: Dave Airlie <airlied@redhat.com>

Dave.

