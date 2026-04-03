Return-Path: <linux-renesas-soc+bounces-30828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAZZKM+Dz2mwwwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:09:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F23929BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B7FD3091D31
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674B93890EA;
	Fri,  3 Apr 2026 09:03:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D498332EC5
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207028; cv=none; b=RWylqqDbCtcDhr9q93uYp2Mx6rsVig7wWpeJLMbWdPr357OMgxiTaXT5FjK9q5573OKxeW4KZwVE1fvrPuiwPdhtl7GBcz3I0R07fuulc5UItaufkJhVrchKpbiN59vJ6pRmYb56HPWMjF3g3qR2KHMgqrI3TXSIXoqkgQrEMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207028; c=relaxed/simple;
	bh=LzbdcnOypVgl8XAOqdjkt07np0ZsfX2Gis+Z8CybTVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4KSlSsPldP91LcQOwWZp4wkMlCVO4CAZ9ZHNNJctN4cMiV3K1bEG2KXTh6KI/4a2wqi/GEDtpQu3TWR1G3HmyLk8aLDUqjQrRBs2QKvqG6ev0R4pPYW2t5dVGwveLLKIeWo393w6t8B0aKS7vId5bWXjdgMnp7ABu74bmfPvsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56cc67e01deso1596178e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207026; x=1775811826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4PkZ6R/mmLwRiMLG8oh7K/G1iaMQnAp/Sqdg+cClo8=;
        b=ZMggJTK4soqLRFL9k9M6REKJv2oqbQvydR6/7G54Z5377+IHX+NgEjxkvCNO4nMJ96
         0tXaMcPj3h1+zVjV4T1WVoNRxAiAl63+AREXburIP86QvlMloxjh4MJEcCmLsH8qjHsF
         aEZObHQ6gljTgNsdzz8j1FwXMMz2tbu+9xAt0cO4U8hgZcJt9pd0iYDPxc11CufPkYZ9
         75aSALxHL9fHuWemSiPg4mjNXkpGGIKG6C2+4sOfOk7Dv19dDKQyTRY08WPdJNWbzv/P
         tjH8SFNmV+cirHhrz+kVLgS8N7qmsBEYq5sZV0pf4uIpyxlSkoiI4XjPwCKeEQvKR2T5
         n4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXPPf1o3Qdgf5bqmMK6LByaG2s96kgnE/QUvh0s+sDkTedvfT+M++EEqxmx1MwRth7ge6bzE9BNk+awHI1jgbfs3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrXGTDnuJFJRdprTdhySxsJxGhUzPlWrM3WLS7p5LfRNDmOywa
	xAcs24Cc6yW26O8QwVVQxshkfidus3dc2bXiGGs6PAvWeebyvHtBBphanD/HqaCs
X-Gm-Gg: AeBDietHNnQJG8kOHOAJ8JAw5BLvcLMYPhRn+991+I/So8CTSLvRmbc+F6LIgZlVNn4
	dvGqIh9pI7mwzLoo07ZGKAXrd/c5QuxCxCdzlyk4V3mw5+r/QcTEV6p+NH4abx9vFENKslJUTxe
	tLUNQYwXy4GR1aOw5vqngTPU9MdeS1Oboyu6tNS2EjVKRyr//GwAjOvloQmxZHeml+4d9Riu3be
	JJmSXtNg0RdQjzwoZnSxosLuyBU+KXV+B4eSEevLSTo2ygyw7CxyjzKDr8KWQUEWxhgJK4R+eJU
	HJgNaVKTEnc7nQITsXAXlOdxOos+m2X34WusAAzT7JnyWYPatL7H6abbrCcZSZJBkCvFF5nrETc
	2/LiwwrJ4HS62Y3z8nxGDu5HX/iPEhc2mFjBllDOXsG+uPuebZmXUe06QeNopsFdxcZLW/0WBv4
	ywU2IUlyVVERSOEt0Nu1C14ZATMnXBkOXnf3bU2xuPxR2enD1Z9Uw0180ywJwEGElo40tXDeQ=
X-Received: by 2002:a05:6102:148f:b0:5ff:e25c:928c with SMTP id ada2fe7eead31-605a50d5344mr793516137.24.1775207026058;
        Fri, 03 Apr 2026 02:03:46 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbac435dsm5668439241.11.2026.04.03.02.03.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:45 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso1001406241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:03:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUn5GeDttlWnjhC2uRix4wqPqNiLeHcS7sm50qgQKC0eQXi4Tm+MpJ5zz9af0vv6cQULNkxWr2iVvMk9iad9nfISA==@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:5ff:fd17:d74e with SMTP id
 ada2fe7eead31-605a5172896mr777997137.34.1775207024732; Fri, 03 Apr 2026
 02:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:03:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWATjW+xKMDHvOGQxbU=vby-ksN-Sy-YNXFz+O5mPHxxQ@mail.gmail.com>
X-Gm-Features: AQROBzChiJZliz9l44U0EaEXy40FbPu9KG1qcLT4sL3xvqKa_3byt050paJddGg
Message-ID: <CAMuHMdWATjW+xKMDHvOGQxbU=vby-ksN-Sy-YNXFz+O5mPHxxQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into DU subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30828-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.822];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,glider.be:email,linux-m68k.org:email,mailbox.org:email,mail.gmail.com:mid,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E6F23929BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into DU subnode to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
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

