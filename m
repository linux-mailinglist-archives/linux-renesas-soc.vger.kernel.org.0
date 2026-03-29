Return-Path: <linux-renesas-soc+bounces-30553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPqmM51TyWnrxQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 18:30:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B94352EC4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 18:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12CA03003D33
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 16:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D0D37F73D;
	Sun, 29 Mar 2026 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZquuoquZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F23375F9C
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801818; cv=pass; b=jTSb60euFS5YOWRgmsX9DoL6XP9aPmPn+edDUrR0zQq2m8Nkd9BsnzEyJ22fJ8xLEVwYN9mgiCJfXjTXg2hKXILgq2nRcdkAliwk37JwqPHjp9rGWYYrns4zSGqCZWMHYFK34mLQqLIt+FTJX9O0HTPV15oARCazKFuEsUGfGl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801818; c=relaxed/simple;
	bh=p4lIU+1nsGLdMetqqXeJQ9ahW73ZNONJJ/LmQF/yYj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOIboKH/7qort0oK+bOd1WyQpkMgIvvSObX/6y5pBHuR2KBJps0o0GfBUj90pHh1kH2EAK3nTxKLTLb/FQyedP2q30CVxkjR7SsWV9nWCGJuXuGT8pJigkDQkjgTRnKhTzmVIaQUT7z1i/x7GoJGCfGHDmZCoa76glhxanuQ24Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZquuoquZ; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-41708f6aa5fso2699020fac.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 09:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801816; cv=none;
        d=google.com; s=arc-20240605;
        b=X+yAhOKpoqbhhCWHyiGYVDL4vrIPt/FUiTp/5d8FI/JsRvp168Yh3JUB60tWyRunLR
         UtvD6cnuinhzpyMfAojLfYC0r7iIF2F5tnkjX4nmlEd5+CGnxRoFkmH9e8xJ5VJw6CYa
         XR07XWMGriqZUqgiVAipct4vHVo07MIzxt/7OYWfNfhLBmqZwfk8hTx0lyd2rQaCHZWJ
         bNwcleUoPOGGgOqESOlmSc4+hsydAgD7/HLT4lPGiZFfNIBlJV/YW56duQUcWN3epVAM
         pHMU3P4GLJb4UZZihyJKgFqqlpo5NgOUKfaZD4NOOw/s4O1FRXz8ZpP8xrVMs7Kgsgbn
         zjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T0D/p9nzBxx668o2DYz5gflSAgYuNp15C5RFWjAJt08=;
        fh=KM82T6IdRPoyLRvaCVDCFc/k5yoF+9lQqP7ZcQX8oe8=;
        b=LByZCQ6zJ+yBU4Tq0nQxZ0FnsCaRbwtNpcnkxdTe/OcjdLlqym5fLHnlh/3tNG7skA
         lLwsKisWcnSk4S2hqaHWwBMQ4/MURqTG3VQHisc9INV4suBBbIyp4tMzKBK3FBDH0sg9
         RiIkYXDudBmuY2O1ZvdF2TPkaRE84dLMKTurSSaANiMZVvfN5QXe3qBcw6kXhKY75MwF
         m/xGm1x2P+MUUSPqhFgHXtglME5lILH7Z5MNBRecNHwljZ6z76H77QZECoLiIG9QX65R
         N11leoh4cdhRWIxOGkFp+pP+5zaqdBZR9dMyeS+0F8JwN0/0DmHThYWPl9IL4UJB08Kc
         qPRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801816; x=1775406616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0D/p9nzBxx668o2DYz5gflSAgYuNp15C5RFWjAJt08=;
        b=ZquuoquZAWWLL9HZb+Uio820xuXTgBHwgUD6OU1+uA3zR1w7zfD3Xl+OtN/zjrftye
         BszQa2yOQu4aTj/V8C36xGc7AppKi0dpiYY2WYFGoBhwtSSI0/18CIAdAHt1TwE6+SgA
         Y3xuvY0nPfFGa5RPTo2N3rwLLn+2yZLd0LE5TYen4AT9tkFKHB/EvtNyZ0iIJhWwbfye
         9Ub2aY0bl8kprfKHH5+Yj9VrSl5X8LPiMyZC52CbxGqzx3d5FJkMMrKXuxUtZgT4BDqB
         UgT3Dvf8WnOvYACxBqRKiBwOLMxFPVvf/waI4EUfSBLQ+3MgYNsinGv2eMN2MvcFJcIc
         vnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801816; x=1775406616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T0D/p9nzBxx668o2DYz5gflSAgYuNp15C5RFWjAJt08=;
        b=Y4Wzf1enI7fk+C8XL5bobHG6/Eg24ic30d9jtfhuMnWrbOOWr3R5c2v9o9TZ6H1a6s
         seLZUi2P9OyO0yEMwb4O3sWS7z1pMWx32OwQY5sYWr/TXB0OuJe/TUN3BYmdHdoaWqoa
         aTMf/od7R3oWJg/TYnG2rT45h7Nd5ROPSAP2kPEzgn+hopi51waYJfE1CfbvjUmC4PS8
         2PUM7tSgW7psLZ9CkV8marsiTy+TzpoKKSnCX+a0LDh36BOU5hxozvkWYm5arDx0fSCY
         wrpPZc6nv+yxLQjiq8PmNzOSlkrJS1X5y7+md3J9WQBJdak8Vtl/8BfBCT9YYD2O7Ig0
         5pyQ==
X-Gm-Message-State: AOJu0Yw9pHm/2Z3Uo5DRBOqjwJo3reFmuqFPaE6Bk7T26/SuQ4bjkXc1
	5bWRsv+CMZ3iyTGSuJUAlC/B1gzlUnJ7MVtyl0IkcbopfeiFf+WBjpX7lLR4tw6E68qA4E/PH1Z
	JUr5A+1yJsb1yNsv23tmRwRM0czZtzw1BmCHB1lY=
X-Gm-Gg: ATEYQzyzGFT4tFPtAC9I37CcW8Mr4ntEgwYHUxLStKuBJpKOfzbq691OYjGbSXKj8le
	msEugfPLw3yv6+WO+iDTxRauYeruCJXMOAY2nv+4d8XpnCYItg6sJH80e2RqxzyT4RR7fK4IC0g
	gK2aL8O55ounmQWaijL8wCyvzVHA+JJY/OdmQLfIvUkDvrYEI+2eeANLvateSMTmxRf6UObWyEl
	IwbvptkemzjXnFN6gi+4+EjrjiERn+vCDYRwtkPdZYGyngwy/pxlmnCi6rRDEBsxkOwMiFFpXo0
	Rgj1ZpPg
X-Received: by 2002:a05:6820:6406:b0:67e:294b:7241 with SMTP id
 006d021491bc7-67e294b7329mr1468563eaf.57.1774801815646; Sun, 29 Mar 2026
 09:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223122132.7435-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260223122132.7435-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:30:04 -0500
X-Gm-Features: AQROBzAPLmV6FgMQZiayqDwUBM03D__n-LeVXLjjJ-damlZWGcRpAT_pNOZvVcY
Message-ID: <CABb+yY2b1xwBrKnz3YTEmJ_5=Df6nRtTsox+b9kFZ71yHU4mug@mail.gmail.com>
Subject: Re: [PATCH] mailbox: correct kdoc title for mbox_bind_client
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30553-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,sang-engineering.com:email]
X-Rspamd-Queue-Id: 65B94352EC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Feb 23, 2026 at 6:21=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> "Request" is wrong, there is a separate function for requesting. This
> functions binds, so describe this.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mailbox/mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 617ba505691d..e63b2292ee7a 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -341,7 +341,7 @@ static int __mbox_bind_client(struct mbox_chan *chan,=
 struct mbox_client *cl)
>  }
>
>  /**
> - * mbox_bind_client - Request a mailbox channel.
> + * mbox_bind_client - Bind client to a mailbox channel.
>   * @chan: The mailbox channel to bind the client to.
>   * @cl: Identity of the client requesting the channel.
>   *
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

