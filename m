Return-Path: <linux-renesas-soc+bounces-3742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53487A9DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 15:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61DD028171D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 14:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C9379C5;
	Wed, 13 Mar 2024 14:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q88p9qlu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD184A34
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2024 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710341939; cv=fail; b=cQ9HSLjRxD7bOOHABXzyQ54Tyy7J+FoMFn1nvufQ19yl3RVNMeFRmJHMECZh7n0Y0jMq33GrIsg6OTfBkbgqWvS93y59a13Viw6FSC3awzQqoQVRZqSQ2jFs/AxTnPCBqJEiVdKbFGLdE/O/t4VmQZpDU1OD7N/TDyyJT4PJSgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710341939; c=relaxed/simple;
	bh=G8BFgkzlI48bkWfdgFOXOSLqLT8g6xL6uwQSDTj93tA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WBvi6Ti9+6hc4y1sDsjIQh6BtuqH3ikG8SaWicl+KKuvp0l8ZJwXDLHso6rmGmfzjBfJYuwqALng3eB8QPbDozwDOQC58viPcyTInKua2t2qqIPJ+2ArMXeYaIQso/XuIC7lWAGQoZcsFxluFzWElXNlAxPCl4Jf90MUMyQ01lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q88p9qlu; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzMCU1JC1kQEwvA9qb/SJNdts4hG07/x6VylCKItbkv1nudhwikZ0Zboxv/VqtU/F8uXRdInBdyr1+SLs6jxEKsGNRnVfoDQnWdbP9AtGQWW4m6Pclqnh5KcZXw+C9fGSr1QF0Ve2D0ebVxmq4Oxgn0HTmXxXXAsjFdqcUAazVD8+zqvas5wgP2ajunKrVVKz8C2FtxyuvrJYWPPd6T+HMFGVftgTwtItZxoEhiOZ3dKRrU9Am5s7+nuMlw7ifgwuqdzsluUQvHl/LggEeIjRNHV3TIjpue4P9RHMbxIw98MwQpTSjhSg8udAMGAnvTzgrsMKFojWJeXEFJ5SUx9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC9LyjtIPqN65FASLcdd7tQtC6X7O2052OBccO/YRYE=;
 b=PwT81bSb8mfKTvi+ckXJBJU2xaQ5k9Dh1WH/2qQTVGqPeS8XgBK6HlIDWmVyRr0f2F/fDxZzUEo1aRyTh2cY67T+JO+fzSixYscRwjZs7T18sIuofMNNRvZbDO5mnRu5h99OpmHUSGlVErMDGpIbC4Ujjs8YRB3/taHSgCnbTQFALjAL4i1FQoUTAEA220OD5Y1Ru+CE2otvdgArHrqFMoQs6v2v7oT+hvpz2TYU/CLE70wvqUg02ttTK0/uuE13/J4CdZ0F9eyEz+OxKpUMFXVjDnLA89xSZhIsWeKKGY12DRI+D8fH4AB4w5TjI3OQuCc7i52+Z1KQZOMWSTKQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC9LyjtIPqN65FASLcdd7tQtC6X7O2052OBccO/YRYE=;
 b=q88p9qlu1BxJbqvRiFVHsRHpvh8VueEhfzR+dV1eWXlDDDyrG9B8V6DciEGqF/2l9lWLIyhGlz6tjI8NwF7LKjnkoSW4PCQfdC24a0uBMEZx+LbWamKIB3R4LNo4eqlkRKiHK0BLG+V1dqHeG4WT2qf2rDNDi0pSFlz5BPFDxMs=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OS3PR01MB10217.jpnprd01.prod.outlook.com (2603:1096:604:1e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 14:58:53 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 14:58:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Marc Zyngier <maz@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] irqchip/renesas-rzg2l: Fix spurious IRQ
Thread-Topic: [PATCH v2 4/5] irqchip/renesas-rzg2l: Fix spurious IRQ
Thread-Index: AQHabyx8poIaYi8ZeUWg+/I7PNCPMrE1yeGAgAACTKA=
Date: Wed, 13 Mar 2024 14:58:52 +0000
Message-ID:
 <OSAPR01MB1587D16D699155C52A240E5B862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
 <20240305183922.138727-5-biju.das.jz@bp.renesas.com> <87msr2nqmy.ffs@tglx>
In-Reply-To: <87msr2nqmy.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OS3PR01MB10217:EE_
x-ms-office365-filtering-correlation-id: 0d065b9f-3b16-4e46-7f84-08dc436e192c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 keBfMYMuVM+Bhlj4Xq+ovg3jChX+wFXRdIxmktlskjUJSy9u+YW4KKNQxDlb5rwXvOpqaFXFN611Gg43BaYRGfhxugdNh5dW4BzlBuxfRY9VjCMhj4axYSyEfHfh7rj5k1hs4OtYkTRcRb8uCui0RdFRt/NoEHP03EUFs8DKH3uUvwRNheYgZyKWpVz6dJzBWHrC/Q3WKSBiiZ22ml+RHNKHIWQpJPNKS1fpMQKD/cd0Qtm1WtRZTA6AUge/jqPDqlNGloSvzTi1FaTBXjgh7XsPb5r9TV9IgS7XBFVIJfTvqECPpeG+l8O6GNnE4iOM42n2xDlPRgndsHtzC2vwwavDLrOuG47O8w/CREmiTO574jsDcR5Ma0KO+EyjwWqhFrk81Rn2S8hLSRgJEUcPa7TTr5YVfeWt1E3O21eKrGGTMSx7afmZo+uRYhQYOXiltT3zLfKLvO871SZE7HTWQHBFLXhfYmaCs8UohmTz5J4InVPkjMixPUVJOFBAHc0GzehuPSq8uIyXfQfgdLj7HSOKzp0ZAUEu6QUkHJ2ssZDWiNuulRY0pbAHX/T2a1NoBgFktVljgrEnX16EJm+zauZalTM0g5VBNVucSLB6Mo1njlosFTLbI98aWrN7UrYrPFbOpyGnzrrg7Tc1X2pJOez0S9SymT4Y23WI+iNxvoymB8R1pQsnbOZskzAgEYB3Q3yaqFljlC5yj6S1KRsaRItaF5wuWXr8H0caXARB1pQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Nl2skWB9CLkSUiyDueQad5kF8Y9dUD1sWF2Dn6G9fo5ayaH2LlWUntS0P31f?=
 =?us-ascii?Q?/MOFdsOyW7DZKPd8eMyg3ZQjpiw+FSa/U+bePhNGVaiBerURP4WahGPXhyat?=
 =?us-ascii?Q?+cfOrXUAgh1dLjiVs2aQupkiLcwM5lPZTzjhXid1ztX2ht+vbtTUVXJWcrqz?=
 =?us-ascii?Q?jZvBmcNjd+FmFHAktBbplXVEDdyYuCrtNGtNB+0Pn8iV0n9oqPbjCARyL3Fr?=
 =?us-ascii?Q?lzb+EMnimHmBdNv0wbjJvWl2yQJ++xfGDNN4yFRDuV4Ti+QJfAwePbUfgv+h?=
 =?us-ascii?Q?U7s/iMyafn8DBDntq3xHQyOIv3O2sndaZOehlOu6pGducYLKLwL4962sa9xT?=
 =?us-ascii?Q?HfvA91NoPCzw19z66wZj69UJ7c5QTpaRsBPBmYzHXKKrFyWunHZ0qdIh7n+U?=
 =?us-ascii?Q?JhmYdYm+OCGgLUl9Xm/Kq24PwzxnQLeZG1LW2oqPkawjO66ehdDcg/CCWsMY?=
 =?us-ascii?Q?77hJSHHgI2H82qNg1WgJeF6raQ8Ysb9XgO7ktBuIqFP87Uinl92gN5K599UZ?=
 =?us-ascii?Q?us6b6//fn0Q/gaFbS64bb52PLHlXFbPUNlLBizlP4Sfmwd1zfd7FuhcKxamT?=
 =?us-ascii?Q?Quuri3HmHeBqQ6moUsQCU9yYsvokcZVZ3ONkeacc/inDUq4FvQk2cVwCEquP?=
 =?us-ascii?Q?2q1HaWLYmoiXTx3g9W/soqmFrZT4Hvr4KswCqyfJ4yWntmEEszTxIuev683i?=
 =?us-ascii?Q?nGf4YoUq43l9/ol1zAIe8xHnyA9b6elKEY1cdOlksqAu6pJzSCzdQgeCF/Rt?=
 =?us-ascii?Q?suWpgVOXvdR5njJVsNoAf0fw6y09S55djzvBuN00xOWUHg4/bDIVunXPVQvx?=
 =?us-ascii?Q?SCX9pLm9gEqYdTZBUs7wO7/2b4HPN1syhjfiuGpuNzjHE4uYPqdZxgHS2qmr?=
 =?us-ascii?Q?i0qnbwKe5Lg/RIRgQS91pkXuUYdhCJtWWqThG7aVA30d2RgbygO9L8/Sv3iG?=
 =?us-ascii?Q?aaSMBAYhiXot3ZHncKaOzUjUv0KWUkDrffXgWUeQBC/iZEy/xgXChX3Vyw7Z?=
 =?us-ascii?Q?kaJlbMe++ykrgFcwNvmjkTnL3lKc49IJAFU5K0VIgTu0CkGYEGenHmTgf8PA?=
 =?us-ascii?Q?TRE0/4DB2mHDWo8++3Abv33XoXh39Z8QVs0m4IMWJ4MnaNvoLVBrXhV+env6?=
 =?us-ascii?Q?u3k/tUBCEcMpolZMpWOEUZB4GFHH9hurhDH+WZwlnI8WicuCYjF7LFsM2U6G?=
 =?us-ascii?Q?9MLJS9UvTTNbVl5ZTGixzhFqX191UMO2KBQkm6/hxMVa0RSL20uJE3EzCHqq?=
 =?us-ascii?Q?uM+87AvZa8SQYrVMoLU7Wu3uyluCCHLfmBmN8ZLzVZBgvT52J38CPQ0gkC0I?=
 =?us-ascii?Q?WazoyNOf5+QXk6V+g1nz8bCDSSuxBCxkCHdzaEYwnx5fauhfAmq6IMmZ/lET?=
 =?us-ascii?Q?AJfz3XbkkyJeaGwkL30/I/9JtKuMUAIawOvynOAqadqKizqF8OYfVd4mdBPc?=
 =?us-ascii?Q?ZK4/KsqDt4psqlX1NkWTX14l/VoivCa41Pswgge98ulAmLSi5KhIarCZ6J94?=
 =?us-ascii?Q?br1mkJ+kKwPpZcET0zqsALhZWIeWbxIwwJuJpKgopMw6+hirRyxiV/Agq9r9?=
 =?us-ascii?Q?SaWSA8LVtM3moMC01QXt1mxnPOAhA7YD5xavtdKVMZFLBwzhqHr9jcBA2eV8?=
 =?us-ascii?Q?Nw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d065b9f-3b16-4e46-7f84-08dc436e192c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 14:58:52.7509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IbwoQiIX5r+ZS31ZSZkdRah/C12SiId7zwtjSnBHB9JJcCDTMxCBuo1eLDN8DiFEuPLG1UB9DXjX0fWgU840WM+Va6XJSxp9x96N9lBwRSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10217

Hi Thomas,

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Wednesday, March 13, 2024 2:38 PM
> Subject: Re: [PATCH v2 4/5] irqchip/renesas-rzg2l: Fix spurious IRQ
>=20
> On Tue, Mar 05 2024 at 18:39, Biju Das wrote:
>=20
> Sorry. I just noticed that this series fell through the cracks.
>=20
> >  static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
> > {
> > -	unsigned int hw_irq =3D irqd_to_hwirq(d) - IRQC_IRQ_START;
> >  	struct rzg2l_irqc_priv *priv =3D irq_data_to_priv(d);
> > +	unsigned int hwirq =3D irqd_to_hwirq(d);
> > +	u32 iitseln =3D hwirq - IRQC_IRQ_START;
> > +	bool clear_irq_int =3D false;
> > +	unsigned long flags;
> >  	u16 sense, tmp;
> >
> >  	switch (type & IRQ_TYPE_SENSE_MASK) { @@ -192,37 +195,59 @@ static
> > int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
> >
> >  	case IRQ_TYPE_EDGE_FALLING:
> >  		sense =3D IITSR_IITSEL_EDGE_FALLING;
> > +		clear_irq_int =3D true;
> >  		break;
> >
> >  	case IRQ_TYPE_EDGE_RISING:
> >  		sense =3D IITSR_IITSEL_EDGE_RISING;
> > +		clear_irq_int =3D true;
> >  		break;
> >
> >  	case IRQ_TYPE_EDGE_BOTH:
> >  		sense =3D IITSR_IITSEL_EDGE_BOTH;
> > +		clear_irq_int =3D true;
> >  		break;
> >
> >  	default:
> >  		return -EINVAL;
> >  	}
> >
> > -	raw_spin_lock(&priv->lock);
> > +	raw_spin_lock_irqsave(&priv->lock, flags);
>=20
> irq_set_type() is always called with irq_desc::lock held and interrupts d=
isabled. What's exactly the
> point of this change?

Oops, in that case this change is not needed.

HW manual mentions, interrupt should be disabled while setting the value.=20

I will drop this change in next version.

Cheers,
Biju


