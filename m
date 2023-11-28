Return-Path: <linux-renesas-soc+bounces-314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00D7FB3A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 09:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F61D1C20BB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 08:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC521156C2;
	Tue, 28 Nov 2023 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="efOJcSB6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EE798
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 00:11:13 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bb8ff22e6so430234e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 00:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1701159072; x=1701763872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fa2rk0rbbAksau9pnzuntjLiYdhb8M7Kh1VWk+u/5dw=;
        b=efOJcSB6h1EVmU91H1QYhhb8kvEmapBZQKXLofqJrPxbqijDlRWFs4K5UY2W2wqLRx
         KfjgzQtgmCzU52VRHUoYUkXbtTMGmFkpBt30H+YolvXsqMusof++sBPfmeebAqzfURIh
         GQYIvlcTP+CbWKj9ZiCTS3ChabnNhUKcBYFeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701159072; x=1701763872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fa2rk0rbbAksau9pnzuntjLiYdhb8M7Kh1VWk+u/5dw=;
        b=kD9TRMpmfkWP9whlX7zwIaWoIfvndog/MrxIbnaifvwxmqSo7KFWL5BFHbi0b/Y4XM
         KqAMi/SPhdNAYLmiAquFwsQWR3w7oPP0GC8b4CdR3D7r1Ky2kORdED5yB0AaydlyPAdv
         D/uBF/aqTX2voZAKkne4H9srYy7BuflLg84ox+V5l3ePnhgCVgadFnSMHKDSKmBJESLT
         n/XtzFa+dL7pJ+qVGjUNsmP7f1QsLc2RFn0bPCwtKr/15UGCSYp6C2qnVzNwjmC9c6qT
         RO0g+mlnSxo+T/UaZBch9hN0wvyRZAhJgHKLCi5fiBFfImpSQ/JbfXUT40JxoZoD1QiT
         2NbA==
X-Gm-Message-State: AOJu0Yws0PuXiK5U28OxmGON65N+GnETe3Yq/u9p+Mtr5Ay3w8MZ3hfr
	Z7SVCai4nVQhN2kaPnaOi5JkP4TS+TVxt0aBejKViA==
X-Google-Smtp-Source: AGHT+IEVLSFrtmdD/nLG1W906crPaKgkuvdvuK+3zNOfwrIAqZ691PRwMS3qRINOEbF51K4waGkGdRSsihFkX1WPuxQ=
X-Received: by 2002:ac2:4d04:0:b0:50b:abb5:287a with SMTP id
 r4-20020ac24d04000000b0050babb5287amr2334034lfi.30.1701159071682; Tue, 28 Nov
 2023 00:11:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128080439.852467-1-claudiu.beznea.uj@bp.renesas.com> <20231128080439.852467-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20231128080439.852467-5-claudiu.beznea.uj@bp.renesas.com>
From: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Date: Tue, 28 Nov 2023 13:41:00 +0530
Message-ID: <CAH-L+nM0PwO93V3NFUobh+6MhaiOsyS3eJ=Lg92HK7vhnMxTaQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] net: ravb: Start TX queues after HW initialization succeeded
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, 
	p.zabel@pengutronix.de, yoshihiro.shimoda.uh@renesas.com, 
	renesas@sang-engineering.com, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, mitsuhiro.kimura.kc@renesas.com, 
	masaru.nagai.vx@renesas.com, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000033c3f6060b31f692"

--00000000000033c3f6060b31f692
Content-Type: multipart/alternative; boundary="0000000000002cf9fe060b31f6df"

--0000000000002cf9fe060b31f6df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 1:35=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> ravb_phy_start() may fail. If that happens, the TX queues will remain
> started. Thus, move the netif_tx_start_all_queues() after PHY is
> successfully initialized.
>
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - none
>
> Changes since [1]:
> - collected Rb tag
>
> [1]
> https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp=
.renesas.com/
>
>  drivers/net/ethernet/renesas/ravb_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Looks good to me.

Reviewed-by: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>

>
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
> b/drivers/net/ethernet/renesas/ravb_main.c
> index 62a986b5de41..2ef46c71f2bb 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1812,13 +1812,13 @@ static int ravb_open(struct net_device *ndev)
>         if (info->gptp)
>                 ravb_ptp_init(ndev, priv->pdev);
>
> -       netif_tx_start_all_queues(ndev);
> -
>         /* PHY control start */
>         error =3D ravb_phy_start(ndev);
>         if (error)
>                 goto out_ptp_stop;
>
> +       netif_tx_start_all_queues(ndev);
> +
>         return 0;
>
>  out_ptp_stop:
> --
> 2.39.2
>
>
>

--=20
Regards,
Kalesh A P

--0000000000002cf9fe060b31f6df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 28, 2023 at 1:35=E2=80=AF=
PM Claudiu &lt;<a href=3D"mailto:claudiu.beznea@tuxon.dev">claudiu.beznea@t=
uxon.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Claudiu Beznea &lt;<a href=3D"mailto:claudiu.beznea.uj@bp.ren=
esas.com" target=3D"_blank">claudiu.beznea.uj@bp.renesas.com</a>&gt;<br>
<br>
ravb_phy_start() may fail. If that happens, the TX queues will remain<br>
started. Thus, move the netif_tx_start_all_queues() after PHY is<br>
successfully initialized.<br>
<br>
Fixes: c156633f1353 (&quot;Renesas Ethernet AVB driver proper&quot;)<br>
Reviewed-by: Sergey Shtylyov &lt;<a href=3D"mailto:s.shtylyov@omp.ru" targe=
t=3D"_blank">s.shtylyov@omp.ru</a>&gt;<br>
Signed-off-by: Claudiu Beznea &lt;<a href=3D"mailto:claudiu.beznea.uj@bp.re=
nesas.com" target=3D"_blank">claudiu.beznea.uj@bp.renesas.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- none<br>
<br>
Changes since [1]:<br>
- collected Rb tag<br>
<br>
[1] <a href=3D"https://lore.kernel.org/all/20231120084606.4083194-1-claudiu=
.beznea.uj@bp.renesas.com/" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com=
/</a><br>
<br>
=C2=A0drivers/net/ethernet/renesas/ravb_main.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br></blockquote><div>=
<br></div>Looks good to me.<br><br><div>Reviewed-by: Kalesh AP &lt;<a href=
=3D"mailto:kalesh-anakkur.purayil@broadcom.com">kalesh-anakkur.purayil@broa=
dcom.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/etherne=
t/renesas/ravb_main.c<br>
index 62a986b5de41..2ef46c71f2bb 100644<br>
--- a/drivers/net/ethernet/renesas/ravb_main.c<br>
+++ b/drivers/net/ethernet/renesas/ravb_main.c<br>
@@ -1812,13 +1812,13 @@ static int ravb_open(struct net_device *ndev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;gptp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ravb_ptp_init(ndev,=
 priv-&gt;pdev);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0netif_tx_start_all_queues(ndev);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* PHY control start */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 error =3D ravb_phy_start(ndev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (error)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_ptp_stop;<=
br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0netif_tx_start_all_queues(ndev);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
=C2=A0out_ptp_stop:<br>
-- <br>
2.39.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Regards,<div>Kalesh A P</div></div></div></div>

--0000000000002cf9fe060b31f6df--

--00000000000033c3f6060b31f692
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBWowggRSoAMCAQICDDfBRQmwNSI92mit0zANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwODI5NTZaFw0yNTA5MTAwODI5NTZaMIGi
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xHzAdBgNVBAMTFkthbGVzaCBBbmFra3VyIFB1cmF5aWwxMjAw
BgkqhkiG9w0BCQEWI2thbGVzaC1hbmFra3VyLnB1cmF5aWxAYnJvYWRjb20uY29tMIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxnv1Reaeezfr6NEmg3xZlh4cz9m7QCN13+j4z1scrX+b
JfnV8xITT5yvwdQv3R3p7nzD/t29lTRWK3wjodUd2nImo6vBaH3JbDwleIjIWhDXLNZ4u7WIXYwx
aQ8lYCdKXRsHXgGPY0+zSx9ddpqHZJlHwcvas3oKnQN9WgzZtsM7A8SJefWkNvkcOtef6bL8Ew+3
FBfXmtsPL9I2vita8gkYzunj9Nu2IM+MnsP7V/+Coy/yZDtFJHp30hDnYGzuOhJchDF9/eASvE8T
T1xqJODKM9xn5xXB1qezadfdgUs8k8QAYyP/oVBafF9uqDudL6otcBnziyDBQdFCuAQN7wIDAQAB
o4IB5DCCAeAwDgYDVR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZC
aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJj
YTIwMjAuY3J0MEEGCCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3Iz
cGVyc29uYWxzaWduMmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNV
HR8EQjBAMD6gPKA6hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNp
Z24yY2EyMDIwLmNybDAuBgNVHREEJzAlgSNrYWxlc2gtYW5ha2t1ci5wdXJheWlsQGJyb2FkY29t
LmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGP
zzAdBgNVHQ4EFgQUI3+tdStI+ABRGSqksMsiCmO9uDAwDQYJKoZIhvcNAQELBQADggEBAGfe1o9b
4wUud0FMjb/FNdc433meL15npjdYWUeioHdlCGB5UvEaMGu71QysfoDOfUNeyO9YKp0h0fm7clvo
cBqeWe4CPv9TQbmLEtXKdEpj5kFZBGmav69mGTlu1A9KDQW3y0CDzCPG2Fdm4s73PnkwvemRk9E2
u9/kcZ8KWVeS+xq+XZ78kGTKQ6Wii3dMK/EHQhnDfidadoN/n+x2ySC8yyDNvy81BocnblQzvbuB
a30CvRuhokNO6Jzh7ZFtjKVMzYas3oo6HXgA+slRszMu4pc+fRPO41FHjeDM76e6P5OnthhnD+NY
x6xokUN65DN1bn2MkeNs0nQpizDqd0QxggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25h
bFNpZ24gMiBDQSAyMDIwAgw3wUUJsDUiPdpordMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcN
AQkEMSIEIF/LID0f2DkzvhJJoLBJ2jQa/VLl5WFhMXCvQs9NosYbMBgGCSqGSIb3DQEJAzELBgkq
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMTEyODA4MTExMlowaQYJKoZIhvcNAQkPMVwwWjAL
BglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG
9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBpiu5lDZcd
epKZYr7cRDMwnMjEEcGugVcaEzJFFw+EiQcoYPRS4MLRiJikh5ANU+nRju6oe8G0Zl+QQIlTix62
AKExxKPOLmSu0YONFdyj3TldRYWlFiIKcO99qJMZzXOAxL8CNhzNUuP/UgiEsR3wcQdbvbZ7GJCh
z5/FbbormUYGRWPn7GiFOdkRgbYE/WKsffnOVDRz3J+CmwqNjSvvO2Qt4DUNi4jBuk8M7TYQ3nQ/
MS4DoMhHEKmOm96AdXZ0mbtpd88hOMe+V2c+45jdXLDcVnW+Nk4fN3lvMWvIm+hOwzF1Zr+/wpta
Nf1nYIYxfo05VSYAiHdIPxJ+m6aB
--00000000000033c3f6060b31f692--

