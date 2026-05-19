Return-Path: <linux-renesas-soc+bounces-32780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKUhLs0MDGodVAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 09:10:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D55578AF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 09:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 990B3305687D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 07:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523DC3ACA7C;
	Tue, 19 May 2026 07:04:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DC23AC0CC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174270; cv=none; b=MqREGVgYof1cTxfCmKWiK/Vw8G+ovO+lutbbh9Q8jsRujYMrrd84S0K2RoL2jUHEyLdS5dwJL1OlYFIkYASGusWTi8XLyrAXg97KouoCNA8yGTUvfMy/uXQYbKWkGFrmznW1p6Lfbk97d/i10XV9TXV/ELuIbGc8pAnjB71yTKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174270; c=relaxed/simple;
	bh=Ck5PYZUAGeP/arKc7+joOM35SGiEsWGbMXReP2dGyfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEJB3deq7xjGiiC93on444oPce8HzRbAsh754pUf9WcIgCroUxgueS0G6mN1sVK0In45q/vUm8nU4kfblWaoHmjRJ4aF72rTyprhlE8aaB7vsrSJSiZotbSvhwOzF/HibBkQ5CRw0B8FhowF5Muq52WdXKrd3bMhqK3BN8oEYOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40ef10ec84cso2829098fac.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 00:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174268; x=1779779068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvqi7WOJmULSzExbjI6JKbD+zff8xMlt2sOcKh3NdpM=;
        b=Eu+p36xCQSaALecsugN9a5wygWNYrMrIIu7rqcvnzUjc4B7fb968YiyhCwxlU6F9sz
         VKxdWvxe9hokxph43fhyiKbxaJ80BsISlRMHd4RF29uljXribMWFXSqE9MLK04BXZtHq
         /Egs/EYiFTUTglLcQ6QIrdQj/qIju0kLs97x13Tk0oCDuogz4ojjcUNmj1u6o9tWtDSQ
         hqWdaanoytuZR/DiM/CtYpFq8fd2CS6HIbbsOAXoucTEiFkbXUNvAR17Bqt9U5laUb88
         QnmJLaVqo4YL+1ndCV8qwwdafFaHPEREP0MlV0xerJ14QdmZ21H4qSWrRHEZlp8Xko0m
         fpMw==
X-Forwarded-Encrypted: i=1; AFNElJ+dmqRCFdITuNUIB6lFFG2O2SxfpkVV/V6IfYU3e6KOkdDH2oGJpA5gvZ//MH/epKZj7PtHXZd0q4v6y0d+/qSsgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1XDl7IE1px8+6qm5p1NhvCy68tpJlfDjnlwUVNMxf4Py06WjO
	59bTr81vfd7WxIDbcLb5lRYrxrJV1TiRYmTAkeHTgFvW+PhQuU5Q9gRYnvgiepU6
X-Gm-Gg: Acq92OHxo6F+/Ge9I0U0p9C/SJ4g8gdh7KzL/pF7oJ8G5sdWaJ7E4fDm1VabCa27X2S
	LAa1PuZsHGNEqxNYU75pMkdAfP5A2lr6HT5P66pjxlDgCwQp9YC+wV9I/2EFLtdRYOtApBEFs8n
	9jX3VPjJ740bTt1tFMdhCGfaDdH2ZyhQj8kK0p2IIUEctCsoehLl2+eC5ZU6rOUAB1mWAYAhELG
	SNujIoqz0KDXQC2Qj3v/++2Nr3h70CT43VM/5K9tDJyrL3t5W392+lNbh9RE2g20+7MNbjL1qA9
	c68mPKsv7pFlx56dlx0cjNndQu8Ervf77kDXa2GI5JGdeqT1My9i8xcXBESK89S38cnT70invCl
	WxYMJxYHMwsCr2ox9/uUBa945klSY4X3pEOFdM6Pc1/Yxc6IEBtIsJXe91sgh1j3aSU9Mpm3CVe
	5BQHqh93lndx9atOfJd0sbkaUnkRfy9QVhktKt+zl4psJykb9jJaJV+shxVk77bOYB
X-Received: by 2002:a05:6820:1746:b0:688:2480:7fa8 with SMTP id 006d021491bc7-69c942dac4dmr12377202eaf.21.1779174267716;
        Tue, 19 May 2026 00:04:27 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm6359789fac.10.2026.05.19.00.04.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:04:27 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-47c918c62b4so2117111b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 00:04:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9PTeAkkkOzbxn5IDa96Rc0hDZzIkUtrb+CoUypgTHMQ11E+rDkM+qKL4l9sh5+5vzlKtOzTK2aQTa9z+XUyWCb/g==@vger.kernel.org
X-Received: by 2002:a05:6102:4a8b:b0:631:26f6:7022 with SMTP id
 ada2fe7eead31-63a3f697fcbmr9602990137.23.1779173872462; Mon, 18 May 2026
 23:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260518155324.168948-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260518155324.168948-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 08:57:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1m1bUJY+7AF+W7hZ_zpcBt=nbJivjr-nrmSLBiZv8qw@mail.gmail.com>
X-Gm-Features: AVHnY4Jc61-evCo6difEXHaRZvepFdF2DA2aBeAZnXipFD8gNqintNb5uzSNM9A
Message-ID: <CAMuHMdW1m1bUJY+7AF+W7hZ_zpcBt=nbJivjr-nrmSLBiZv8qw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add
 RZ/V2H(P) support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32780-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,bp.renesas.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,renesas.com:email,sashiko.dev:url]
X-Rspamd-Queue-Id: 11D55578AF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Mon, 18 May 2026 at 17:53, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for the PCIe controller found on the Renesas RZ/V2H(P) SoC.
>
> The RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
> additional registers and configuration bits for PCIe lane control. It
> supports multilink operation configured as either a single x4 link
> or two independent x2 link controllers.
>
> Unlike earlier SoCs supported by this driver which only feature a single
> PCIe controller, the RZ/V2H(P) SoC implements two controllers. Both
> controllers rely on the system controller (`sysc`) for configuration,
> but the required registers reside at different offsets for each instance.
> To correctly identify the controller instance and map the corresponding
> system controller registers, make the "linux,pci-domain" and "num-lanes"
> properties mandatory for this SoC and restrict their values according to
> the hardware capabilities.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml

> @@ -235,6 +238,20 @@ allOf:
>            maxItems: 1
>          reset-names:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-pcie
> +    then:
> +      properties:
> +        linux,pci-domain:
> +          enum: [0, 1]

Sashiko has the following comments about this property[1]:

| Is it appropriate to use linux,pci-domain to identify the hardware
| controller instance?
| Device Tree is designed to describe hardware rather than software policy
| or configuration. The linux,pci-domain property is an OS-specific hint
| used to assign logical PCI domain numbers.
| Using it to identify hardware instances strictly couples the hardware
| register mapping to an OS numbering scheme.

and

| Does limiting this to [0, 1] cause a regression for valid software
| configurations?
| For example, if a board with multiple PCIe controllers assigns domains 2
| and 3 to these instances to avoid conflicts, the binding will fail
| validation and the driver will fail to probe.
| Could the hardware instances instead be identified via standard hardware
| descriptive mechanisms, such as their physical base address (reg),
| standard aliases, or by adding a phandle specifier argument to
| renesas,sysc?

dtschema/schemas/pci/pci-host-bridge.yaml states:

| linux,pci-domain:
|   description:
|     If present this property assigns a fixed PCI domain number to a
host bridge,
|     otherwise an unstable (across boots) unique number will be assigned.
|     It is required to either not set this property at all or set it for all
|     host bridges in the system, otherwise potentially conflicting
domain numbers
|     may be assigned to root buses behind different host bridges.  The domain
|     number for each host bridge in the system must be unique.

In the RZ/V2H case, the number is local to the SYSC instance referenced
by the renesas,sysc property, while linux,pci-domain is global to the
full system by definition. Fixing the numbers to zero and one works,
until some other controller in the system has conflicting requirements.

I do see a future case where this may break: if Renesas would release a
new SoC containing two RZ/V2H dies, there would be four PCIe controllers
and two SYSC controllers.  This would require two PCIe controllers to
have linux,pci-domain = <0>, and two having linux,pci-domain = <1>,
which is not permitted.

Hence adding a second cell to the renesas,sysc property, to specify
the base offset of the PCIe-related registers inside SYSC seems like
the best way to go?

[1] https://sashiko.dev/#/patchset/20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

