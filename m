Return-Path: <linux-renesas-soc+bounces-33198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHUEJAS+FmqPqgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 11:48:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC085E216A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 11:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 627F4301944B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 09:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221A83EDE66;
	Wed, 27 May 2026 09:44:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423023EE1CB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875056; cv=none; b=clI4rsRjsrmss4sOsUUGZ5Ju6pWFU44n4k+h/h1fPnyr21mrcxb0ysWFtDO2L+QIy3a6+nir2Vt0uMSMeRliZu2nZNCiVFYDD3adOX4d6MKfMf5OicNCY1JmP+PSEGeOkfvAhGRZaHZ9q4Gukb00J46fHnuqA4Ei9vIjheQ4A6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875056; c=relaxed/simple;
	bh=LfCe4LNPMVUu5fOQZ/DhPw5AXt+DrtW/uZ2vlE+ITCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Exs0jWX6Kx8KvtTsVJHj1S/826a4xooghLaYMdDqqUmYRLzBASK/epxpN0jAplq1S48riUuRPSdw0Ady7qB88eqEQftvLg91mgdHbp8VliUzE7IrjLpxPlJii5uSFxSkzbj25wJhLiQ177A+0ySzO4rHQxr8xzFTz0QNsFs3k1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-90fbf21d9d3so1742253885a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 02:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875053; x=1780479853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLue29P8rf5xvQmGeNSTeRRA/wr2HEJIYgSnfhWuBRc=;
        b=f0L5KRm2cgwf5oK/jWfl1RLD+ZzVWY0oWf6fgaBjjj/EySlPn+V+0pqtIDRHyjtHip
         aHA1Nm+OBQ89i5PmHKZ1kWgE5ST/XHOkbQEzNVvmM17aPOdg0eVbrO8CMv6LbC9WQpdA
         JLiOLaZZLXubcFkkmWzUNKaEQHZ9sCLkc5m4GHEHD1xEYtJ6SjT1OgW+R+4djsLD6+OX
         2903IgxA5h7mfx0O6Hnh4OVI333fNimgrd9sDcJ6CSps8St0jC6BER+kD30aJIMJecyf
         5N1ZAPlmWXjpBy30evhbSzqSVYYMHWWBbtbpm8J2yGtMAbtY2xb2rWw+AISHTDTfnYqL
         n2VA==
X-Forwarded-Encrypted: i=1; AFNElJ94+ns1YqPM7+ws3v+rd84pBgtrD4uabk+sPdp0+hXFaXA03Vtw6DEsDrmw0gywBnTTu6KQxMl+EODZs3merY+HAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1Kodb81GhPo52lWIK9YwiL1vaLMhJgIaYj2/gNnZVUYo3lT2
	8hO11Sww6it975k83OLK45dZc4ZpiwQDowd25eopv9Um3U2LQAw1jQvB4DDWXpppT0o=
X-Gm-Gg: Acq92OHnzhqxycX02pEKTMCTYCsLmC4FsgCVteRVn1I79YReV5Ied1EtWu2LFPw28Aw
	JSwlZ87FL5kqAe4y7+UcjJNgV7QZFgvktyr94gGX1Ud8kDG8iEtBjBDQqj5OqjwU6a1E8ZN9GbV
	IvdDCt4TuVYgjG3TTe5WSyOcrfie00j6+vIaPL/IaI8AQcvAPV3FtFjPdi3jm/wT7tg3FaskJpT
	JMrWmY2U6m64gwabxO+xY+eZl/oBIdiKv7517oUugbTgzGLFZKVosu16IkL0e3EU2et48Adyle0
	yK0p3OpoTALL630oXOeDh9cyrfGWY/Lt/PPxofF32YnBsYgKu0JJBsitHDMhdQ41w5W+CBl8fUV
	iNgJYHH3E72wqgn6QZPo4Gd24TFdPvQwtwBVid8JUeuABT+fw4l00GobEGIw5zBuLRMw3z6zQjb
	mv1xryMU7RcZBdqWMj6leUF5Umy414bezVPwaKqz6ZjraKNnozBQworFs5Dgr1uLLduZ2Rbnk=
X-Received: by 2002:a05:620a:649b:b0:914:c53f:4d51 with SMTP id af79cd13be357-914c53f5006mr2607949985a.53.1779875053117;
        Wed, 27 May 2026 02:44:13 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87d1a9bsm424531885a.30.2026.05.27.02.44.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 02:44:12 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8b4298d271fso216761576d6.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 02:44:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CLE8L1PAq+junbONkDjs8uAq0/pam2TcGkRDBBlQEDo43/VMnW7R5bfPLM6dKyZ532qso75l9+nD5HG/44GVNmw==@vger.kernel.org
X-Received: by 2002:a05:6122:ca1:b0:575:3b34:28b6 with SMTP id
 71dfb90a1353d-586624cee61mr10718336e0c.11.1779874595383; Wed, 27 May 2026
 02:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org> <20260522102251.1723392-5-claudiu.beznea@kernel.org>
In-Reply-To: <20260522102251.1723392-5-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 11:36:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqe4JK9TibiaXO9m1k2YHqS0fYtN4O-GkYszSfMt1OOQ@mail.gmail.com>
X-Gm-Features: AVHnY4KKBDZVJSxF14oLw6h140lrQziFwBUZAfBfWP_NxcAjjTCmNb4Q9eatVi0
Message-ID: <CAMuHMdWqe4JK9TibiaXO9m1k2YHqS0fYtN4O-GkYszSfMt1OOQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] pinctrl: renesas: rzg2l: Use tab instead of spaces
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, wsa+renesas@sang-engineering.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sang-engineering.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-33198-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.935];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,glider.be:email,linux-m68k.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ECC085E216A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 at 12:23, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use tab instead of spaces to follow the same coding style.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

