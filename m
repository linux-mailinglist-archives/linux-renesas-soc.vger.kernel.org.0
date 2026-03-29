Return-Path: <linux-renesas-soc+bounces-30551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kn+It9QyWnrxQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 18:18:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 736D9352D6D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 18:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57E5C30034A7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 16:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B772525F99F;
	Sun, 29 Mar 2026 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NStkZ9Lo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318824A044
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 16:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801113; cv=pass; b=r/qYMz5qp9ExgCnpxi7fVsdUnCxJocskxjj8Rt+Mzy7YZlGFu87KDkQdXTKiGd0XmfwFxNFTv/wNcXlv5iD1Is/w88u9hIb76ZXvNl+vu9G2Ri7uXjBwQpYfrJOirFwr6oRuSpImhvUtm5QvARpcLPjy1GYYgmG2Xv3+Zc4c0gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801113; c=relaxed/simple;
	bh=wESoaTuoz7O6q11jMlGvpszGIWB4zFZYJnXsfOIDpS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iisR8ztfX90s6wtIzJkkdoRnEKiy+545SmcNjAq81r8VU7fVoLvoaA0rhKfjAmqZfDGfSTCVHZugSzPPGsl/ASJwTXvWSe+nNeRjDFRLGVSvgDOrO1A5SvGyV27mSVjcvh0o/ifMjk/ABAceetGaJ5KuaAcEi68OHHE+eNZzbbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NStkZ9Lo; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-463a0e14abfso2116679b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 09:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801111; cv=none;
        d=google.com; s=arc-20240605;
        b=X2REUVQqHUhq3MzAIxeiF/R+tDqw1Q10wvOR6LVcvdDu47NzapovP2M164oW/j4ue+
         hmpajUIGl4CA2sLVLJFOb2gVKQ9bc6MsvoRkvk3HMXz2foW5CqxHNScfOtb2TmPgMeUp
         0+pPP4WPZuSuO9wKG6KZ2xCAAQ7OaUsrKR/ovyZKRVOVyVtxeEJ6xhl5jkMUyOeSUmEY
         qCbckkm0IAoNtAUkMJSHJGstSUXkZ5ZK7pcze/PvRb05ztj4P/ozYISB5jit5ntcaWba
         02SUciPLXdf8PIdeNlpuVhvubMs7pxOoECnBQtN67aMP/YnAzQ+vaf21orOzAfVCn0ya
         Oe5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCn1JbO8C3jEusQHEaT2WBa24JhMvI6ycb9MnVn+P+o=;
        fh=lWZuwTq+eHv/RINm3VqkhNbQGloveH3ap6ACoCqy3vQ=;
        b=jP9tJHTFmo67PJ9dk5WZv8PxZu5h9zaSp0T54qM6zaxEE2TdvL0lDLzEI0prLTAIPJ
         /KCiDX+0QpWXsMCOHKPRl8LUD0S+QkVBh01DU6ty1jrZPTNi6A+qfK4LjgjSonTX4t5e
         KiTcrucrVkFWVJKN8+tBGwq58YjXi7QK/3932WuYd3LgMeEmeoqPo7Is20ie4h7CwYQq
         L6th+O78iMjEO+GoSjU/N8Eso3LkcU71ecDgq2mCLnDq8iuvEE43jh0resWO0UFH6/N1
         pRfoNJmlj8ZskuUuLYSyVLW3jvx5LdMA6vlu4Ypu97sEU7Ss6f/MGPLsjHpRDLD/j9Nz
         7H1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801111; x=1775405911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCn1JbO8C3jEusQHEaT2WBa24JhMvI6ycb9MnVn+P+o=;
        b=NStkZ9Lol93JkoHFydu4Tkx39hgZ+qSlkG0dPMxKJq4FpZtW5hjOi2/oMR58C/FTaU
         p8xB6E4kETjDPptQhxJZ+VSPBXTdzoR6dOAUI784Kr2cxm+Pm2QweB1EV2NDwAhtT9Bz
         FbaSUPxKDHkVGjJ0+Dj8BFZLlld0HdYjR+6/UhLr89BUFGQyEkwuU1hmuOfbelwY6t4K
         l2ppdK3WB2cQezHREuLSFtcA+tJhT+DLu/MJ/sQfwBjBOlsqjrZFsvV6xd9GrYct+T6A
         W7T9UvxSJ+aiWHDPv2BIjb/c683Gwz++uyPCSnrUBC7auNsCpY0aYunrRmZmy35HWoD0
         H9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801111; x=1775405911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCn1JbO8C3jEusQHEaT2WBa24JhMvI6ycb9MnVn+P+o=;
        b=Gn8pjVQ4dk9s++DIRjC0LwxJ2tSBiG52Mx6tDPx1A97GsKcqPxo6RGkPOAFtTSdYEI
         4jjpa2W56Eo55XYLu2Wme7nYWONmGKKJZC/iV084zX6d1NZbVh3X5F5GRWUm+dbHIlcO
         ynZrave956/p4NGL9GE0DVc075Oj9pqbrD0aZZRNa7LNDv+kLhkCLTEpwVCqB/lYt3o4
         fXZbMNEGaWBTW6aOcaf9KV0ETSdTrCuEVWCFzgbxdG2vzdcs03w08E1v+ENoFZPV+d2H
         buLSfD99UvExg7dq5PlFSdpAZsQu4oeET+OX7No6Vag3FKGcyOpoW3sXeeaPYfYNybC3
         rU6g==
X-Gm-Message-State: AOJu0YwRq6e57myNMxjSXx8qqEDBekw7k4SKAm+eF9kzW5z4Y2ubEawW
	pEptMo1R6y8Fs7VQy79u/sq7F2UuuJcS6fFwnGZs1xsCtGyf0y/U97iX1kw9jlumRjgd3frhLN5
	ZdxUGsx/iB8pfeJPIfhYg6WGMGyFE9BE=
X-Gm-Gg: ATEYQzy7grH1lCxnO+OAq8YnFxtAERS13y0sgu5pc8Ejd+HjpM7TsqcE056g7CNElmm
	5ptgvDoPkxmnGFCuhG1uRoodUFJs8MM4ui6ijrB+c1nPGWwixKqCw4jJljzJXWXjrWa6g5jXkf9
	RfwQ/WPQnF1inLBAVPuARsVKhXo8g1F9ekiXZN11zXvYiP2hx6fsD5Tzd821H5U2cyWN8ODReSu
	o83GE713E+MWmBy0KthtmGOYtxXvzAiNNAAUtTQtiyMlmgqImazU7LCvAcpDWg49mhzDVBaJR97
	xaBI+Hxv
X-Received: by 2002:a05:6808:6ec9:b0:469:f699:af80 with SMTP id
 5614622812f47-46a8a678559mr4398405b6e.55.1774801111154; Sun, 29 Mar 2026
 09:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327151217.5327-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260327151217.5327-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:18:20 -0500
X-Gm-Features: AQROBzCkpd-4P6CiAMbDaBcbMU8mW4GdyKN134I7CRxZ5VCPPluHFGpERA_FdMQ
Message-ID: <CABb+yY3CXBOcA+jSS6DqgojsnjQMr81yLdE1QqBcefRDhrn2WA@mail.gmail.com>
Subject: Re: [PATCH v5] mailbox: test: really ignore optional memory resources
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30551-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 736D9352D6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:12=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Memory resources are optional but if the resource is empty
> devm_platform_get_and_ioremap_resource() prints an error nonetheless.
> Refactor the code to check the resources locally first and process them
> only if they are present. The -EBUSY error message of ioremap_resource()
> is still kept because it is correct. The comment which explains that a
> plain ioremap() is tried as a workaround is turned into a info message.
> So, a user will be informed about it, too.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Changes since v4:
> * rebased to 7.0-rc5
> * add tag (Thanks, Geert!)
>
>  drivers/mailbox/mailbox-test.c | 37 +++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-tes=
t.c
> index 3a28ab5c42e5..058c0fe4b9c2 100644
> --- a/drivers/mailbox/mailbox-test.c
> +++ b/drivers/mailbox/mailbox-test.c
> @@ -355,11 +355,27 @@ mbox_test_request_channel(struct platform_device *p=
dev, const char *name)
>         return channel;
>  }
>
> +static void __iomem *mbox_test_ioremap(struct platform_device *pdev, uns=
igned int res_num)
> +{
> +       struct resource *res;
> +       void __iomem *mmio;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, res_num);
> +       if (!res)
> +               return NULL;
> +
> +       mmio =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (PTR_ERR(mmio) =3D=3D -EBUSY) {
> +               dev_info(&pdev->dev, "trying workaround with plain iorema=
p\n");
> +               return devm_ioremap(&pdev->dev, res->start, resource_size=
(res));
> +       }
> +
> +       return IS_ERR(mmio) ? NULL : mmio;
> +}
> +
>  static int mbox_test_probe(struct platform_device *pdev)
>  {
>         struct mbox_test_device *tdev;
> -       struct resource *res;
> -       resource_size_t size;
>         int ret;
>
>         tdev =3D devm_kzalloc(&pdev->dev, sizeof(*tdev), GFP_KERNEL);
> @@ -367,23 +383,12 @@ static int mbox_test_probe(struct platform_device *=
pdev)
>                 return -ENOMEM;
>
>         /* It's okay for MMIO to be NULL */
> -       tdev->tx_mmio =3D devm_platform_get_and_ioremap_resource(pdev, 0,=
 &res);
> -       if (PTR_ERR(tdev->tx_mmio) =3D=3D -EBUSY) {
> -               /* if reserved area in SRAM, try just ioremap */
> -               size =3D resource_size(res);
> -               tdev->tx_mmio =3D devm_ioremap(&pdev->dev, res->start, si=
ze);
> -       } else if (IS_ERR(tdev->tx_mmio)) {
> -               tdev->tx_mmio =3D NULL;
> -       }
> +       tdev->tx_mmio =3D mbox_test_ioremap(pdev, 0);
>
>         /* If specified, second reg entry is Rx MMIO */
> -       tdev->rx_mmio =3D devm_platform_get_and_ioremap_resource(pdev, 1,=
 &res);
> -       if (PTR_ERR(tdev->rx_mmio) =3D=3D -EBUSY) {
> -               size =3D resource_size(res);
> -               tdev->rx_mmio =3D devm_ioremap(&pdev->dev, res->start, si=
ze);
> -       } else if (IS_ERR(tdev->rx_mmio)) {
> +       tdev->rx_mmio =3D mbox_test_ioremap(pdev, 1);
> +       if (!tdev->rx_mmio)
>                 tdev->rx_mmio =3D tdev->tx_mmio;
> -       }
>
>         tdev->tx_channel =3D mbox_test_request_channel(pdev, "tx");
>         tdev->rx_channel =3D mbox_test_request_channel(pdev, "rx");
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

