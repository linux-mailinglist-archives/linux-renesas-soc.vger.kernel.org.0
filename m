Return-Path: <linux-renesas-soc+bounces-33011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKdYNzpcEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:38:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 351AB5B54AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDDBD3065056
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13793CC332;
	Fri, 22 May 2026 13:34:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E983CC33F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456861; cv=none; b=LXlnj1k5CjMTiT04qqFeg2blGORzRKUJBg3K/wWXNcu7m9G/lSnxVy4ibo5IDJ0J/IpY9zt+n3+zwNL3LZnz/nhJ0mRuG2dIXW/4No9zbFb2C2bcanNMqwg+mMoUwx/NyIT/lS/kdFNMPPLD7qo6WfaDRdXp3dCudKSM/9U+Wg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456861; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5kAIUz8a3J4LovgCKXa3K8DZQ8FWn6HA6Y59vlVwGYUTRFkH08N0dau3XuUPCSR7H/2TxPCrGDa0jh+qVpWJd8JJldjT2bovLjD3LvjeVUch6xvJ8qRGU+rQaXdy5f5qRYihjHIOf4fHlCyIiJreV2fO4cN33ssbvbK2b6H8yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57513a91514so2421660e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456859; x=1780061659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=meOb0mCM2dnwpVqfuR4wPZhQjH7AInK5opakkI17lD3cNUjt7dbfZvzUlpRTKQV9eW
         /4+KsHQEX7jEvTliQVHugTcIOQHi5HiheHBKih1mzcFG5SoZ8s7zLfRLNDqUsLjxxVwf
         GHhx3e0qXWinWrXUeOTPnmPfwTVsgIHWLNRXHCuqPhEK4zawOOCmdMpU2MC+EaBiuVAP
         BQYPQF3j+/d1O8/ik6bjgQ26V8psKKdnr0Wci3t4UUF8vwPqaQJRMPYltbxEvIeoOwAD
         W7lqVHBvTFl087ze2uB40R4m1kyLA1LfCqFfSR17pLlBr0k4EnJ8F8/wL03542fQNgzO
         ShJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FlhJSQi3Oni+iwPwpTfkNskWTwYxZ7erwmSNSG13ark6+hpR7B4CTMdJ1DVu2Xx5WXoCd1UX6Rn+iiluYn4c+bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykqaHVEpHFF72dGtu6LyXPUJbjDpm0mbXNxTOXQStLt6jGov0o
	ukbr7oEKcSX6/O1o3YtrjkWRUd43Qn8yympGfWwhl+PcWkGRiBrz4P1YUOF0Y1CHhSE=
X-Gm-Gg: Acq92OFbiy9rVa2hQsQX7u2coMi0QiEBQNgFUsGtMf7eoXRZubJ8oviH0a7quY5JrQ1
	kaseXLUcg13x2Kr2t0Ebcj/wk9NDo9o02bk2zCY7rdQ3onUxIdVCMtolI8RTEepXaduTN90xGpb
	ekPCW1yFta5zc8Eg+HBtoVAst/FnA+d3S8pQeunOcHJl1hg58m+H/MycWrD+vvUVLORpt2F0TKR
	q+1yuPyJGCQ9ZVImgYlw3/R+UrKuxC4nzIkUb67HqiMF+714dIThhfwDuUJtjGDRy+E3wTjKILP
	rTkyLV52m3a/VDJBs7gm1STYEEpQpOILbOWDoeoMPqongomaQ4CO/GKFz2d6ETYIGmFCbLc4Xv3
	sVG7tKMGUGgW0cl6nC7ScWuuwc9kkmhzs0B7eqW3cnmfS4clZUs0OxAT/GCBXC+jOc5RqOxEel8
	4u6ePE+3HPPDCrZHpag0kF9MPul+OjQiCsk4czGLKtPe1YvOUAoCK+oNl3KO3zdnk1
X-Received: by 2002:a05:6122:1796:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-58663966692mr1897941e0c.13.1779456859213;
        Fri, 22 May 2026 06:34:19 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586ec46c8ddsm2260015e0c.0.2026.05.22.06.34.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:34:17 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57533363201so2367999e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:34:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UpMvsy5i13tAT8U83hAVc98MwIVvQrNZoozjXnkn0cYvxOGgbAIC1EI/K0uGYhW2Fl1EzS3qAfuXcnerEa0H19Q==@vger.kernel.org
X-Received: by 2002:a05:6122:3214:b0:56f:2609:cd95 with SMTP id
 71dfb90a1353d-586626bd8acmr2048945e0c.9.1779456857164; Fri, 22 May 2026
 06:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:34:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7cQ8N3L0g6K4nsJSy8UUut2hNcP7=FovSf+UK_VzwDw@mail.gmail.com>
X-Gm-Features: AVHnY4L1t-E-4KNi3I0TSerFd7ad9ospqXgo4JNrc9drpmUktdoXOv4OmGqhgvQ
Message-ID: <CAMuHMdX7cQ8N3L0g6K4nsJSy8UUut2hNcP7=FovSf+UK_VzwDw@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: ulcb: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33011-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 351AB5B54AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

