Return-Path: <linux-renesas-soc+bounces-30832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAr/KN6Gz2mwwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:22:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 580DA392B9C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D3D03011782
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD6D3659F9;
	Fri,  3 Apr 2026 09:22:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CCB33D501
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208147; cv=none; b=uFSc0+n2vs3fz4WEsS/dNSqU9lqiJis5eEwZieGksWR7i8AtH8BcjwU5G0AhpdZ3WgzP0OBdtn7HKXmmqnvza8zCNWdKl64R76tVJTrl1k6P/dYtU62yKmLbZYz5yyg6j2YdQwpzaVCGSH+XtjkoIi7I/6BkDMeGAamp/+DIeZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208147; c=relaxed/simple;
	bh=qMViffoztCTMqn48QLb9zX/hHyoMuIjIFeYSehCl+Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJvAKiOGrvvwnIbOeoM918EgpRNCfmivGf9SR6JYnIDHNcNKaksiOZPuc+ZJXIMJ5ixIUOjrIerJJdf8472Uyh00HBqD8EL8SNKr6sdn0J5idRO026I//ENiFVtme6rPXEbR41Fw73KERxCHD170zmBkGjSf0h/y5gvqs0IlMS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-605048a9c94so437196137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208145; x=1775812945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqTHZkYXx3XaUYuf56o3EDTX420ivEQjaKKZt4Gr+jk=;
        b=S/Ji+Pa4k+1yQCHTk8KAY+pKlaVw8k9ivzGMmJFsgDtNOXiDKC9gRKvUQE7WDIjPOD
         VgW6uTOEMc9b3Spi9N3gN69qN12w2Ki2P5YT8RJSv6ZWCdvzPX3/6+81Zx9WIpwiiKBC
         nhSSOJ2TtOaJqrwE/XYwwXkiYwbxvwqltxda5ooEYEIlXYp73BoJBdKRL4B+vJDuN8Q9
         E26TIiqW7ja7QjrogTctgYiOFm8q/NCy8IUwBbIN1eV2uyRXMK3OzKlbSYlYolga80bi
         zoOpyFiiFuXv6PszfB5uQkvXia8OaU1bZ3+glFYh25dJIlomTWC3GXj9vdLrtXFjVv5Z
         v1Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVNUa70lF3Pkp1+c+DN2mQDHDkeGIM8NFamT5nQgzbOeY/kDukwHKIq06IeoW2LxcKl7QDXXb6FFubL/ozUYuKuyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz51Pa4bKIYJzP0Z7HV6BRMg7SPRBQ/NJHc+2XSDmKSUF7y19Yj
	LHn6VxLcB8rLJDHTiIBBEh8uesG1ZTWllSj0cOwTU3yZP2bX0ecrnEx4VUOE61kx
X-Gm-Gg: AeBDietuuXfSLloFcuOzKChG/tB+TpS74oJ9j+jE0xCbdNBBJ7OOG0DAdP61rFaHXOa
	XDUxYFo6iRN784RpVwVWJmE8YCClXgdHGcMZaj50Ai7silhLgkew7U7+Z46qt+Z7ideo0Yx4t3k
	HLBbn32AFkNOuFVNiLbYqJybZFzJEKEzs8IR3IQMYSe8R1yzwKoPNiz9Ze4vQMjr8KKWiKnxVhy
	F3KNXBrinG57jyP/60aGyWIWBDR7EX6yihnqd/coHl5jEXw2A9rpDxIinWFZPyL8AK8+FFuORxV
	TbXroEvSr50iiAWCdtBOPGZqLqZxBMdy5J4OhO9PfiToxuS1nOjVHPxIpmDrHVH0QcdaIowfvrJ
	ZrdhBlqkVhM9SFXcTB0v6GtK6sz/fUw5BwWc0tjulQiXASFgZ6vE0MlUg8kXyLO/V0mcVXa9ad5
	4o4Mkyj12herBTvTa+oAO7fy67+ZeFUbVwrvRVBig5fqpLwtv0hZp7uA5dG9aYGYck
X-Received: by 2002:a05:6102:5e81:b0:605:c5c:10e8 with SMTP id ada2fe7eead31-605a51b2debmr690424137.31.1775208144746;
        Fri, 03 Apr 2026 02:22:24 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm5497535241.7.2026.04.03.02.22.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:22:24 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9076813bso724929e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:22:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIMfSXgGt7n3d9qJW5jOr7IPWf6+82ImtBgHwLs0XnsDUHD5GojKarAu545jEziWovdaGa+/TO5ENxP4XVNaKQug==@vger.kernel.org
X-Received: by 2002:a05:6122:698d:b0:56c:d623:896e with SMTP id
 71dfb90a1353d-56daba305a0mr682606e0c.14.1775208143755; Fri, 03 Apr 2026
 02:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:22:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaXqvoyzFOMMtCuMchAJamOGD4WKG5_16sy7NAUvKVzA@mail.gmail.com>
X-Gm-Features: AQROBzCnb6VpPRGvatHwhBVrCjOQ7-o3JrWeLFgYVGZIXfX3Imq6Fsi--Hd35Yg
Message-ID: <CAMuHMdWaXqvoyzFOMMtCuMchAJamOGD4WKG5_16sy7NAUvKVzA@mail.gmail.com>
Subject: Re: [PATCH 2/6] ARM: dts: renesas: r8a7779: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30832-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.816];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,mailbox.org:email]
X-Rspamd-Queue-Id: 580DA392B9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r8a7779.dtsi:707.12-712.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
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

