Return-Path: <linux-renesas-soc+bounces-28693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BobA/XBpmn3TQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 12:11:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B61ED7F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 12:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52409305C30C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 11:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B52411626;
	Tue,  3 Mar 2026 11:11:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FFA3E5EF8
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536271; cv=none; b=fz7uJmZghMl+zQQUmLQHbLqf0Yx9Cjh2Tmo2zaXTbpS9TQoE1cO0+uTbM3zM58NHdojYI24J8T5aK6MK6QlLZPxDXRyyQ4j7zghAzRomwXiPrbaFJTZBTszT4TdMqVlD2OIYBAgCCSa5se/p9ax2R3cB0OvxP6Hej9wHLYMkPgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536271; c=relaxed/simple;
	bh=wcIwDHWaI/QAd3tnHqg2UkUxqMc3lp5PaozKFMFq02M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXH7iTO1ns7Rz7rgszq7WFgSxnSAAut1lf3yG26jdGFWQj5ek2l3/nxBbhNqhHvvKCcbSTzjsKeGEK1LTq89j9Vi658GwQtAYSRdWWSrVBV19ZoBTDrAr5UK5COJvkcLWCzT0EgWBtqAyNBC8pYCWaUn8pL3pucKDFQ8uoe9mQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5674cd243d9so4970351e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 03:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772536269; x=1773141069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV/KO3KpjUzxgj2Jw7RNV4iDlyh/EVM7jddY7omy6H8=;
        b=bobsmny2/McKRqmPwWgpXYGpb0nO+firqXYGVazrcWrn6gYbYOSYOx0ZN5S/4ysza7
         agznarg4vTTnJBI9iUdaw2DJrfhHnTF48ufdTMyqjkumP2A08YzYuN4Dnzxm+qhykfXP
         0NrXkWdtQBWyJQ3tgvFndX7Qb0PCEQFh/4S0ch4xBCWmk99fYGIUvQ+/C0Gcp+TWPLU7
         0dm6ttdc5o7kYfsfLCW1tyP6HdFWProjhUeqP47P5BXNOAFUgjdryV39xqcpP7S+Rh0/
         zMJYv8e369TqlE9MrFzsqWahwSFTcHH8BQyy9fgtyd9wrLG/IF47SQoWDEojCS0suFQM
         tUFQ==
X-Gm-Message-State: AOJu0YyW4XOspndklDRRMX57fsQOkoqxFlog8vpaN0DrHAfMgUkOXMHN
	vx5nEEOjx9XctcGhN/5CPM7a9NbmfHAFgm4D9h5jP4IqayqGmMb4atX+jddPhr0I
X-Gm-Gg: ATEYQzxyBVmaUsJ7fqnpB59avjx/65FGZp35+72ASStaxO/wfK0Bym7e2zfaoY5FVmW
	jtLOutkfOlo1n0e72Q7Wl0vNIy52d+PVxv3dRwV/3xpyezcE7y8pChZvux/w4z554IOscMnu569
	nRi8B4hSxoWgoXSbBdovt4QFkISUg/0f+TPHSUtqNtaVIOsOOQD8VlXXDaG9eVKMGyF/QBqEEUs
	5gMAdUOG2MVMZQ3IJIXG+GV8OSt7u+0g28ATtfnJaeyDC8lO+vVJuE5YO5T2MHcciQIAnauUcuc
	uJj+P8680FMqOvfAPNoLNs1alESTb25AsQm5jxDujzmu3MJIstdXnkFsQUYCXZv7ezVgt3HkByE
	FcDYO54VEMXsmCWQsLNcr6PFgcOqmYRTils2sKJSBYUm407iFWbtC+BsJ5lYrASzdsmTFcbHwdl
	R/KBGVar4ayWf9a9vjYkNUqvXorySzkTrArXzubn6gg3F4jpWGWNEnJLVysaW2
X-Received: by 2002:a05:6102:3e8a:b0:5ef:233e:6b25 with SMTP id ada2fe7eead31-5ff8fb2da4amr749681137.13.1772536268789;
        Tue, 03 Mar 2026 03:11:08 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df65a2a0esm14079789241.12.2026.03.03.03.11.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:11:08 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ff9d047981so36829137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 03:11:08 -0800 (PST)
X-Received: by 2002:a05:6102:441b:b0:5f1:b59d:a824 with SMTP id
 ada2fe7eead31-5ff8fb28a67mr721092137.10.1772536268215; Tue, 03 Mar 2026
 03:11:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223123022.7657-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260223123022.7657-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 12:10:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuh3-cryVknRhN+WGQQ_YaqNK=EvBzbo_XZDik6Vkv_Q@mail.gmail.com>
X-Gm-Features: AaiRm519Tb_3v-U1NSOED4-kiHyGYlS0GG2eQNfKWtIpqbYI0vJli8CI6ilj2JE
Message-ID: <CAMuHMdUuh3-cryVknRhN+WGQQ_YaqNK=EvBzbo_XZDik6Vkv_Q@mail.gmail.com>
Subject: Re: [PATCH v2] mailbox: test: really ignore optional memory resources
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6F0B61ED7F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-28693-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.062];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email,sang-engineering.com:email]
X-Rspamd-Action: no action

Hi Wolfram,

On Mon, 23 Feb 2026 at 13:30, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Memory resources are optional but if the resource is empty
> devm_platform_get_and_ioremap_resource() prints an error nonetheless.
> Refactor the code to check the resources locally first and process them
> only if they are present. The -EBUSY error message of ioremap_resource()
> is still kept because it is correct. The comment which explains that a
> plain ioremap() is tried as a workaround is turned into a info message.
> So, a user will be informed about it, too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/mailbox/mailbox-test.c
> +++ b/drivers/mailbox/mailbox-test.c
> @@ -355,11 +355,30 @@ mbox_test_request_channel(struct platform_device *pdev, const char *name)
>         return channel;
>  }
>
> -static int mbox_test_probe(struct platform_device *pdev)
> +static void *mbox_test_ioremap(struct platform_device *pdev, unsigned int res_num)
>  {
> -       struct mbox_test_device *tdev;
>         struct resource *res;
>         resource_size_t size;
> +       void *mmio = NULL;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, res_num);
> +       if (res) {

if (!res)
        return NULL;

> +               mmio = devm_ioremap_resource(&pdev->dev, res);
> +               if (PTR_ERR(mmio) == -EBUSY) {
> +                       dev_info(&pdev->dev, "trying workaround with plain ioremap\n");
> +                       size = resource_size(res);

With the reduced indentation, you don't need a temporary to avoid the
next line being too long.

> +                       mmio = devm_ioremap(&pdev->dev, res->start, size);

return devm_ioremap(...);

> +               } else if (IS_ERR(mmio)) {
> +                       mmio = NULL;
> +               }
> +       }
> +
> +       return mmio;

return IS_ERR(mmio) ? NULL : mmio;


> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

